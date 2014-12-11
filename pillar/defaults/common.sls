pkgs:
  - tig
  - tmux
  {% if grains['os'] == 'MacOS' %}
  - htop-osx
  {% else %}
  - htop
  {% endif %}
