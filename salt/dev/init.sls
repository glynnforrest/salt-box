dev_tmux:
  pkg.installed:
    - name: tmux

dev_tig:
  pkg.installed:
    - name: tig

dev_htop:
  pkg.installed:
  {% if grains['os'] == 'MacOS' %}
    - name: htop-osx
  {% else %}
    - name: htop
  {% endif %}
