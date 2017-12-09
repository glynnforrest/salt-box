{% set user = pillar['user'] %}

{%- if grains['os'] == 'MacOS' %}
netbeans_java:
  cmd.run:
    - name: 'brew cask install java'
    - unless: 'test -d /Library/Java'
    - runas: {{user}}

netbeans_ide:
  cmd.run:
    - name: 'brew cask install netbeans'
    - unless: 'test -d /Applications/Netbeans/NetBeans\ 8.2.app'
    - runas: {{user}}
{%- endif %}
