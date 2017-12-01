{% if grains['os'] == 'MacOS' %}
include:
  - nodejs.mac
{% endif %}
{% if grains['os'] == 'Debian' %}
include:
  - nodejs.debian
{% endif %}

{% for pkg in ['yarn', 'gulp', 'ember-cli', 'vue-cli'] %}
nodejs_{{pkg}}:
  npm.installed:
    - name: {{pkg}}
{% endfor %}
