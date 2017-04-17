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

media_vimpc:
  pkg.installed:
    - name: vimpc

media_youtube_dl:
  pkg.installed:
    - name: youtube-dl

media_ffmpeg:
  pkg.installed:
    - name: ffmpeg

media_imagemagick:
  pkg.installed:
    - name: imagemagick
