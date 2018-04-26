{% set user = pillar['user'] %}

{% if grains['os'] == 'MacOS' %}
browsers_chrome:
  cmd.run:
    - name: 'brew cask install google-chrome'
    - unless: 'test -d /Applications/Google\ Chrome.app'
    - runas: {{user}}

browsers_firefox:
  cmd.run:
    - name: 'brew cask install firefox'
    - unless: 'test -d /Applications/Firefox.app'
    - runas: {{user}}
{% else %}
browsers_chromium:
  pkg.installed:
    - name: chromium
{% endif %}
