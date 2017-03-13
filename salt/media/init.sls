{% set user = pillar['user'] %}

{% if grains['os'] == 'MacOS' %}
media_vlc:
  cmd.run:
    - name: 'brew cask install vlc'
    - unless: 'test -d /Applications/VLC.app'
    - runas: {{user}}
{% endif %}

media_mpc:
  pkg.installed:
    - name: mpc

media_ncmpcpp:
  pkg.installed:
    - name: ncmpcpp
