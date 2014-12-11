{% for pkg in salt['pillar.get']('php:packages') %}
Install {{pkg}}:
  pkg.installed:
    - name: {{pkg}}
{% endfor %}

{% if salt['pillar.get']('php:use_xdebug') %}
Install xdebug:
  pkg.installed:
    - name: {{salt['pillar.get']('php:pkg_names:xdebug')}}
{% else %}
Uninstall xdebug:
  pkg.removed:
    - name: {{salt['pillar.get']('php:pkg_names:xdebug')}}
{% endif %}
