{% set user = pillar['user'] %}

{% if grains['os'] == 'MacOS' %}
{% set repo_target = '/Users/' ~ user ~ '/.emacs.d' %}
{% else %}
{% set repo_target = '/home/' ~ user ~ '/.emacs.d' %}
{% endif %}

emacs:
  pkg.installed:
    - name: emacs

{% if salt['pillar.get']('emacs:repo') %}
emacs_config:
  git.latest:
    - name: {{ salt['pillar.get']('emacs:repo') }}
    - rev: master
    - target: {{repo_target}}
    - user: {{user}}
    - unless: 'test -d {{repo_target}}'
{% endif %}

emacs_ispell:
  pkg.installed:
    - name: ispell
