Install apache:
  pkg:
    - installed
    - name: {{salt['pillar.get']('apache:pkg_name')}}
  service:
    - running
    - name: {{salt['pillar.get']('apache:service_name')}}
    - enable: true
    - require:
      - pkg: Install apache
  apache_module.enable:
    - name: rewrite

{% if salt['pillar.get']('apache:use_php') %}
Install apache mod php:
  pkg.installed:
    - name: libapache2-mod-php5

Setup apache php.ini:
  file:
    - managed
    - name: {{salt['pillar.get']('php:apache_ini_path')}}
    - source: salt://php/php.ini.j2
    - template: jinja

{% else %}
Uninstall apache mod php:
  pkg.removed:
    - name: libapache2-mod-php5
{% endif %}

{% for item in salt['pillar.get']('apache:virtual_hosts') %}

{% if item['symlink'] is defined %}
Set up {{item['host']}} symlink:
  file.symlink:
    - name: /var/www/{{item['host']}}
    - target: {{item['symlink']}}
    - force: true
{% else %}
Set up {{item['host']}} directory:
  file.directory:
    - name: /var/www/{{item['host']}}
{% endif %}

Set up {{item['host']}}:
  file:
    - managed
    - name: /etc/apache2/sites-available/{{item['host']}}
    - source: salt://apache/virtual_host.conf.j2
    - template: jinja
    - defaults:
        host: {{item['host']}}
        docroot: {{item['docroot']}}

Enable {{item['host']}}:
  file.symlink:
    - name: /etc/apache2/sites-enabled/{{item['host']}}
    - target: /etc/apache2/sites-available/{{item['host']}}

{% endfor %}
