{% set user = pillar['user'] %}

{%- if grains['os'] == 'MacOS' %}
sql_sequel_pro:
  cmd.run:
    - name: 'brew cask install sequel-pro'
    - unless: 'test -d /Applications/Sequel\ Pro.app'
    - runas: {{user}}

sql_dbeaver:
  cmd.run:
    - name: 'brew cask install dbeaver-community'
    - unless: 'test -d /Applications/DBeaver.app'
    - runas: {{user}}
{%- endif %}
