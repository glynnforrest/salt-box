{% set user = pillar['user'] %}

# audacity must be installed manually, as fosshub doesn't allow for automated downloads
# http://www.audacityteam.org/download/mac/

{% if grains['os'] == 'MacOS' %}
soundflower:
  cmd.run:
    - name: 'brew cask install soundflower'
    - unless: 'test -d /Library/Extensions/Soundflower.kext'
    - runas: {{user}}
{% endif %}
