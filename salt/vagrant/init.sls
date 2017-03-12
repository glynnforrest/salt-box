{% set user = pillar['user'] %}

{% if grains['os'] == 'MacOS' %}
vagrant_install:
  cmd.run:
    - name: 'brew cask install vagrant'
    - unless: 'which vagrant'
    - runas: {{user}}

vagrant_virtualbox:
  cmd.run:
    - name: 'brew cask install virtualbox'
    - unless: 'which VirtualBox'
    - runas: {{user}}
{% endif %}
