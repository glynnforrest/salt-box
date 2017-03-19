{% set user = pillar['user'] %}

mac_setup_script:
  cmd.script:
    - name: salt://mac/setup.sh
    - runas: {{user}}
    - unless: 'test -f ~/.mac-setup'

mac_spectacle:
  cmd.run:
    - name: 'brew cask install spectacle'
    - unless: 'test -d /Applications/Spectacle.app'
    - runas: {{user}}
