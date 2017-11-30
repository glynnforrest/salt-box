{% set user = pillar['user'] %}

{% if grains['os'] == 'MacOS' %}
calibre:
  cmd.run:
    - name: 'brew cask install calibre'
    - unless: 'test -d /Applications/calibre.app'
    - runas: {{user}}
{% endif %}
