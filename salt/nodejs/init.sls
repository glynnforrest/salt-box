nodejs_install:
  pkg.installed:
    - name: node

{% for pkg in ['gulp', 'bower'] %}
nodejs_{{pkg}}:
  npm.installed:
    - name: {{pkg}}
{% endfor %}
