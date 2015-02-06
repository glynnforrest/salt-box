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
