{% if grains['os'] == 'MacOS' %}
include:
  - nodejs.mac
{% endif %}
{% if grains['os'] == 'Debian' %}
include:
  - nodejs.debian
{% endif %}

nodejs_global_pkgs:
  npm.installed:
    - pkgs:
      - yarn
      - ember-cli
      - vue-cli
      - vue-language-server
