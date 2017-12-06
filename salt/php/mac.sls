# can't use pkg.installed for these, it fails with slash namespaced pkgs
# https://github.com/saltstack/salt/issues/26407
{% set user = pillar['user'] %}

php_install:
  cmd.run:
    - name: 'brew install homebrew/php/php71'
    - runas: {{user}}
    - unless:  'brew list --full-name | grep homebrew/php/php71'
  file.managed:
    - name: '/usr/local/etc/php/7.1/php.ini'
    - source: salt://php/php_mac.ini

{% for pkg in ['ssh2', 'intl'] %}
php_{{pkg}}:
  cmd.run:
    - name: 'brew install homebrew/php/php71-{{pkg}}'
    - runas: {{user}}
    - unless:  'brew list --full-name | grep homebrew/php/php71-{{pkg}}'
{% endfor %}

php_composer:
  cmd.run:
    - name: 'brew install homebrew/php/composer'
    - runas: {{user}}
    - unless:  'brew list --full-name | grep homebrew/php/composer'

php_psysh:
  cmd.run:
    - name: 'brew install homebrew/php/psysh'
    - runas: {{user}}
    - unless:  'brew list --full-name | grep homebrew/php/psysh'

