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
