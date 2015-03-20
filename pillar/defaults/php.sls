php:
  packages:
    {% if grains['os'] == 'MacOS' %}
    - php55
    - php54
    - php53
    - php55-ssh2
    {% else %}
    - php5
    - php5-cli
    - php5-common
    - php5-curl
    - php5-dev
    - php5-gd
    - php5-mcrypt
    - php5-mysql
    - php5-xmlrpc
    - libssh2-php
    - php5-intl
    - php5-sqlite
    {% endif %}

  pkg_names:
    {% if grains['os'] == 'MacOS' %}
    xdebug: php55-xdebug
    {% else %}
    xdebug: php5-xdebug
    {% endif %}

  use_xdebug: False

  cli_ini_dir: /etc/php5/cli
  apache_ini_dir: /etc/php5/apache2
