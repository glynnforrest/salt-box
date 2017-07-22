{% set user = pillar['user'] %}

{% if grains['os'] == 'MacOS' %}
inkscape_xquartz:
  cmd.run:
    - name: 'brew cask install xquartz'
    - unless: 'test -d /Applications/Utilities/XQuartz.app'
    - runas: {{user}}

inkscape:
  cmd.run:
    - name: 'brew cask install inkscape'
    - unless: 'test -d /Applications/Inkscape.app'
    - runas: {{user}}
    - require:
      - cmd: inkscape_xquartz
{% endif %}
