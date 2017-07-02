python:
  pkg.installed:
    - name: python

{% for pkg in [
  'git-sweep',
  'proselint',
  'pygments',
  'salt',
  'sphinx',
  'sphinx-autobuild',
  'sphinx_rtd_theme',
  'urllib3',
] %}

python_pip_{{pkg}}:
  pip.installed:
    - name: {{pkg}}
{% endfor %}
