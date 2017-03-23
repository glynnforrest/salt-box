# can't use pkg.installed for these, it fails with slash namespaced pkgs
# https://github.com/saltstack/salt/issues/26407
{% set user = pillar['user'] %}

php_install:
  cmd.run:
    - name: 'brew install homebrew/php/php71'
    - runas: {{user}}
    - unless:  'brew list --full-name | grep homebrew/php/php71'

php_composer:
  cmd.run:
    - name: 'brew install homebrew/php/composer'
    - runas: {{user}}
    - unless:  'brew list --full-name | grep homebrew/php/composer'

php_cs_fixer:
  file.managed:
    - name: /usr/local/bin/php-cs-fixer
    - source: 'https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.1.2/php-cs-fixer.phar'
    - source_hash: 'e42188019768b35067c11ef5ba653a41df5072ea'
    - mode: 0755
