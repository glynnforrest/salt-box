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
