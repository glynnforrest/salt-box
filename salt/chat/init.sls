{% set user = pillar['user'] %}
{%- if grains['os'] == 'MacOS' %}
chat_limechat:
  cmd.run:
    - name: 'brew cask install limechat'
    - unless: 'test -d /Applications/LimeChat.app'
    - runas: {{user}}

chat_whatsapp:
  cmd.run:
    - name: 'brew cask install whatsapp'
    - unless: 'test -d /Applications/WhatsApp.app'
    - runas: {{user}}

chat_slack:
  cmd.run:
    - name: 'brew cask install slack'
    - unless: 'test -d /Applications/Slack.app'
    - runas: {{user}}
{%- endif %}
