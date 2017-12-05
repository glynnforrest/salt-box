python:
  pkg.installed:
    - name: python

python_pip_pkgs:
  pip.installed:
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
