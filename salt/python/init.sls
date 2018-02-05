python:
  pkg.installed:
    - pkgs:
      - python
{%- if grains['os'] == 'Debian' %}
      - python-pip
{%- endif %}

python_pip_pkgs:
  pip.installed:
    - require:
      - pkg: python
    - pkgs:
      - git-sweep
      - proselint
      - pygments
      - python-language-server
      - salt
      - sphinx
      - sphinx-autobuild
      - sphinx_rtd_theme
      - urllib3
