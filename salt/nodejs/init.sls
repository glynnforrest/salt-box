Install nodejs:
  pkg.installed:
    - name: node

Install npm:
  cmd.run:
    - cwd: /tmp
    - name: '`which curl` https://www.npmjs.com/install.sh | sh'
    - unless: test -f /usr/local/bin/node

{% for pkg in salt['pillar.get']('nodejs:npm_pkgs') %}
Install {{pkg}}:
  npm.installed:
    - name: {{pkg}}
{% endfor %}
