# a simple lamp server for churning out php sites
{% set sites = salt['pillar.get']('lampserver:sites', []) %}
{% set user = pillar['user'] %}

apache:
  pkg.installed:
    - name: apache2
  file.managed:
    - name: /etc/apache2/envvars
    - source: salt://lampserver/envvars.j2
    - template: jinja
    - defaults:
        user: {{user}}
    - watch_in:
        - service: apache2
  service.running:
    - name: apache2
    - require:
      - pkg: apache2

apache_modules:
  apache_module.enabled:
    - name: rewrite
    - watch_in:
        - service: apache2

own_www:
  file.directory:
    - name: /var/www
    - user: {{user}}
    - group: www-data

apache_default_host:
  file.managed:
    - name: /etc/apache2/sites-enabled/000-default.conf
    - force: True
    - source: salt://lampserver/default_virtualhost.conf
    - watch_in:
      - service: apache2

apache_default_index:
  file.managed:
    - name: /var/www/000-default/index.html
    - makedirs: True
    - source: salt://lampserver/index.html.j2
    - template: jinja
    - defaults:
        sites: {{sites}}

php:
  pkg.latest:
    - names:
{%- if grains['osmajorrelease'] == 8 %}
      - libapache2-mod-php5
      - php5
      - php5-curl
      - php5-gd
      - php5-intl
      - php5-mysql
      - php5-sqlite
      - php5-ssh2
{%- else %}
      - libapache2-mod-php7.0
      - php-ssh2
      - php7.0
      - php7.0-curl
      - php7.0-gd
      - php7.0-intl
      - php7.0-mysql
      - php7.0-sqlite3
      - php7.0-xml
      - php7.0-zip
{%- endif %}

download_composer:
  cmd.run:
    - cwd: /tmp
    - name: 'curl -sS https://getcomposer.org/installer | php'
    - env:
        - COMPOSER_HOME: /usr/local/bin
    - unless: test -f /usr/local/bin/composer

install_composer:
  cmd.wait:
    - name: mv /tmp/composer.phar /usr/local/bin/composer
    - cwd: /root
    - unless: test -f /usr/local/bin/composer
    - watch:
      - cmd: download_composer

mysql_server:
  pkg.installed:
    - names:
      - mysql-server
      - mysql-client
      - python-mysqldb
  service.running:
    - name: mysql
    - enable: True

mysql_root_password:
    mysql_user.present:
        - name: root
        - password: root
    file.managed:
        - name: /root/.my.cnf
        - source: salt://lampserver/root_my.cnf
        - user: root
        - group: root
        - mode: 0600

{% for site in sites %}
apache_site_{{site.name}}:
  file.managed:
    - name: /etc/apache2/sites-enabled/{{site.name}}.conf
    - source: salt://lampserver/virtualhost.conf.j2
    - template: jinja
    - defaults:
        site: {{site}}
    - watch_in:
      - service: apache2

mysql_user_{{site.name}}:
  mysql_user.present:
    - name: {{site.name}}
    - password: {{site.name}}

mysql_db_{{site.name}}:
  mysql_database.present:
    - name: {{site.name}}

mysql_{{site.name}}_grants:
  mysql_grants.present:
    - grant: ALL
    - database: '{{site.name}}.*'
    - user: {{site.name}}
    - host: localhost
{% endfor %}
