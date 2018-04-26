php_extensions:
  pkg.installed:
    - names:
        - php5-imagick

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
