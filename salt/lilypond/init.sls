{% set user = pillar['user'] %}

{% if grains['os'] == 'MacOS' %}
lilypond:
  cmd.run:
    - name: 'brew cask install lilypond'
    - unless: 'which lilypond'
    - runas: {{user}}
{% endif %}
