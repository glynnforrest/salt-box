{% for pkg in salt['pillar.get']('pkgs') %}
Install {{pkg}}:
  pkg.installed:
    - name: {{pkg}}
{% endfor %}
