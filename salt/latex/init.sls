{% set user = pillar['user'] %}

{% if grains['os'] == 'MacOS' %}
latex:
  cmd.run:
    - name: 'brew cask install mactex'
    - runas: {{user}}
    - unless: 'test -d /Applications/TeX'
{% endif %}
