{% for pkg in salt['pillar.get']('php:packages') %}
Install {{pkg}}:
  pkg.installed:
    - name: {{pkg}}
{% endfor %}

{% if salt['pillar.get']('php:use_xdebug') %}
Install xdebug:
  pkg.installed:
    - name: {{salt['pillar.get']('php:pkg_names:xdebug')}}
{% else %}
Uninstall xdebug:
  pkg.removed:
    - name: {{salt['pillar.get']('php:pkg_names:xdebug')}}
{% endif %}

{% if grains['os'] == 'Debian' %}
Setup cli php.ini:
  file:
    - managed
    - name: {{salt['pillar.get']('php:cli_ini_dir')}}/php.ini
    - source: salt://php/php.ini.j2
    - template: jinja

Remove cli php conf.d symlink:
  file:
    - absent
    - name: {{salt['pillar.get']('php:cli_ini_dir')}}/conf.d
{% endif %}

Download composer:
  cmd.run:
    - cwd: /tmp
    - name: '`which curl` -sS https://getcomposer.org/installer | php'
    - unless: test -f /usr/local/bin/composer

Install composer:
  cmd.wait:
    - name: mv /tmp/composer.phar /usr/local/bin/composer
    - cwd: /root
    - unless: test -f /usr/local/bin/composer
    - watch:
      - cmd: Download composer
