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
{% else %}
vagrant_install:
  pkg.installed:
    - name: vagrant

vagrant_virtualbox:
  pkgrepo.managed:
    - name: deb http://download.virtualbox.org/virtualbox/debian stretch contrib
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc
  pkg.installed:
    - names:
        - virtualbox-5.0
        - net-tools
    - require:
      - pkgrepo: vagrant_virtualbox
{% endif %}

vagrant_vbguest:
  cmd.run:
    - name: 'vagrant plugin install vagrant-vbguest'
    - unless: 'vagrant plugin list | grep vagrant-vbguest'
    - runas: {{user}}
