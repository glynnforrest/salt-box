Install mysql server:
  pkg:
    - installed
    - name: {{salt['pillar.get']('mysql:pkg_names:server')}}
  service:
    - running
    - name: {{salt['pillar.get']('mysql:service_name')}}
    - enable: true

Install mysql client:
  pkg:
    - installed
    - name: {{salt['pillar.get']('mysql:pkg_names:client')}}

Install python deps:
  pkg.installed:
    - name: python-mysqldb

{% for database in salt['pillar.get']('mysql:databases') %}
Database {{database}}:
  mysql_database.present:
    - name: {{database}}
{% endfor %}
