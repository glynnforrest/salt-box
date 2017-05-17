{% set user = pillar['user'] %}

{% if grains['os'] == 'MacOS' %}
musescore_dmg:
  cmd.run:
    - name: 'brew cask install musescore'
    - unless: 'test -d /Applications/MuseScore\ 2.app'
    - runas: {{user}}
{% endif %}
