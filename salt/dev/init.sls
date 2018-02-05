{% set user = pillar['user'] %}
{% set shell = salt['pillar.get']('dev:shell', '/bin/bash') %}

{% if grains['os'] == 'MacOS' %}
include:
  - dev.mac
{% endif %}
{% if grains['os'] == 'Debian' %}
include:
  - dev.debian
{% endif %}

dev_set_shell:
  user.present:
    - name: {{user}}
    - shell: {{shell}}

dev_pkgs:
  pkg.installed:
    - names:
      - tmux
      - tig
      - figlet
      - stow
      - watch
      - tree
      - jq
      - markdown
      - htop
      - terraform

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
