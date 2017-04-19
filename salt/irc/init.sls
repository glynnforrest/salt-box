{% set user = pillar['user'] %}
{%- if grains['os'] == 'MacOS' %}
irc_limechat:
  cmd.run:
    - name: 'brew cask install limechat'
    - unless: 'test -d /Applications/LimeChat.app'
    - runas: {{user}}
{%- endif %}
