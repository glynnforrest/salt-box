{% set user = pillar['user'] %}

dev_mac_pkgs:
  pkg.installed:
    - names:
      - fzf
      - md5sha1sum
      - fswatch
      - ripgrep
      - fasd
      - hugo
      - tcptunnel
      - terraform

dev_iterm2:
  cmd.run:
    - name: 'brew cask install iterm2'
    - unless: 'test -d /Applications/iTerm.app'
    - runas: {{user}}

dev_licecap:
  cmd.run:
    - name: 'brew cask install licecap'
    - unless: 'test -d /Applications/LICEcap.app'
    - runas: {{user}}
