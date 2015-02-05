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

{% for item in salt['pillar.get']('apache:virtual_hosts') %}
Set up {{item['host']}}:
  file:
    - managed
    - name: /etc/apache2/sites-available/{{item['host']}}
    - source: salt://apache/virtual_host.conf.j2
    - template: jinja
    - defaults:
        host: {{item['host']}}
        docroot: {{item['docroot']}}
{% endfor %}
