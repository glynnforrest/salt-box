nodejs_install:
  pkg.installed:
    - name: node

{% for pkg in ['gulp', 'bower', 'ember-cli'] %}
nodejs_{{pkg}}:
  npm.installed:
    - name: {{pkg}}
{% endfor %}

nodejs_phantomjs:
    pkg.installed:
        - name: phantomjs
