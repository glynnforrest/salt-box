{% set user = pillar['user'] %}

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
