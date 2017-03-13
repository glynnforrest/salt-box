{% set user = pillar['user'] %}
{% set shell = salt['pillar.get']('dev:shell', '/bin/bash') %}

dev_set_shell:
  user.present:
    - name: {{user}}
    - shell: {{shell}}

dev_tmux:
  pkg.installed:
    - name: tmux

dev_tig:
  pkg.installed:
    - name: tig

dev_htop:
  pkg.installed:
  {% if grains['os'] == 'MacOS' %}
    - name: htop-osx
  {% else %}
    - name: htop
  {% endif %}

dev_fasd:
  pkg.installed:
    - name: fasd

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
{%- if install %}
    cmd.run:
        - name: {{install}}
        - runas: {{user}}
        - cwd: {{target}}
        - require:
            - git: dev_dotfiles
{%- endif %}
{%- endif %}
