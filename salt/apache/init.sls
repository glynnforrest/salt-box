Install apache:
  pkg:
    - installed
    - name: {{salt['pillar.get']('apache:pkg_name')}}
  service:
    - running
    - name: {{salt['pillar.get']('apache:service_name')}}
    - enable: true
    - require:
      - pkg: Install apache

{% if salt['pillar.get']('apache:use_php') %}
Install apache mod php:
  pkg.installed:
    - name: libapache2-mod-php5
{% else %}
Uninstall apache mod php:
  pkg.removed:
    - name: libapache2-mod-php5
{% endif %}
