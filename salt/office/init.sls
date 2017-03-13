{% set user = pillar['user'] %}

{% if grains['os'] == 'MacOS' %}
office_libreoffice:
  cmd.run:
    - name: 'brew cask install libreoffice'
    - unless: 'test -d /Applications/LibreOffice.app'
    - runas: {{user}}
{% endif %}
