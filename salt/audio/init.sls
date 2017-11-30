{% set user = pillar['user'] %}

# audacity must be installed manually, as fosshub doesn't allow for automated downloads
# http://www.audacityteam.org/download/mac/
# may need to install liblame from here
# http://manual.audacityteam.org/man/installing_and_updating_audacity_on_mac_os_x.html#maclame

{% if grains['os'] == 'MacOS' %}
soundflower:
  cmd.run:
    - name: 'brew cask install soundflower'
    - unless: 'test -d /Library/Extensions/Soundflower.kext'
    - runas: {{user}}
{% endif %}
