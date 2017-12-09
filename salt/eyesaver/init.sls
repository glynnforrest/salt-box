{% set user = pillar['user'] %}

{%- if grains['os'] == 'MacOS' %}
eyesaver_flux:
  cmd.run:
    - name: brew cask install flux
    - unless: test -d /Applications/Flux.app
    - runas: {{user}}
{%- else %}
eyesaver_redshift:
  pkg.installed:
    - name: redshift
{%- endif %}
