{%- if grains['os'] == 'MacOS' %}
include:
  - php.mac
{%- endif %}

{%- if grains['os'] == 'Debian' %}
include:
  - php.debian
{%- endif %}

php_cs_fixer:
  file.managed:
    - name: /usr/local/bin/php-cs-fixer
    - source: 'https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.1.2/php-cs-fixer.phar'
    - source_hash: 'e42188019768b35067c11ef5ba653a41df5072ea'
    - mode: 0755

php_symfony_installer:
  # archive.extracted is busted in salt 2016.11.3, see https://github.com/saltstack/salt/issues/39751
  # archive.extracted:
  #   - name: /tmp/symfony-installer
  #   - source: 'https://github.com/symfony/symfony-installer/archive/v1.5.9.zip'
  #   - enforce_toplevel: False
  #   - source_hash: 'b88f512f7cacf508b9290989be1b50da21b6dfbc'
  #   - unless: which symfony
  cmd.run:
    - name: 'curl -L https://symfony.com/installer -o /tmp/symfony-installer'
    - unless: which symfony
  file.managed:
    - name: /usr/local/bin/symfony
    # - source: /tmp/symfony-installer/symfony
    - source: /tmp/symfony-installer
    - mode: 0755
    - unless: which symfony
    - require:
        - cmd: php_symfony_installer
      # - archive: php_symfony_installer
