{% set user = pillar['user'] %}
{% set shell = salt['pillar.get']('dev:shell', '/bin/bash') %}

dev_set_shell:
  user.present:
    - name: {{user}}
    - shell: {{shell}}

dev_pkgs:
  pkg.installed:
    - names:
      - tmux
      - tig
      - fasd
      - figlet
      - fzf
      - stow
      - watch
      - ripgrep
      - md5sha1sum
      - tree
      - fswatch
      - hugo
      - jq
      - markdown
      - htop

{% if grains['os'] == 'MacOS' %}
dev_iterm2:
  cmd.run:
    - name: 'brew cask install iterm2'
    - unless: 'test -d /Applications/iTerm.app'
    - runas: {{user}}
{% endif %}

{%- if salt['pillar.get']('dev:dotfiles') %}
{% set repo = pillar['dev']['dotfiles']['repo'] %}
{% set target = pillar['dev']['dotfiles']['target'] %}
{% set install = salt['pillar.get']('dev:dotfiles:install') %}

dev_dotfiles:
    git.latest:
        - name: {{repo}}
        - user: {{user}}
        - target: {{target}}
        - unless: 'test -d {{target}}'
{%- if install %}
    cmd.run:
        - name: {{install}}
        - runas: {{user}}
        - cwd: {{target}}
        - require:
            - git: dev_dotfiles
{%- endif %}
{%- endif %}

dev_licecap:
  cmd.run:
    - name: 'brew cask install licecap'
    - unless: 'test -d /Applications/LICEcap.app'
    - runas: {{user}}
