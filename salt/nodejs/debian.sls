nodejs:
  pkgrepo.managed:
    - name: deb https://deb.nodesource.com/node_8.x jessie main
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
  pkg.latest:
    - name: nodejs
    - require:
      - pkgrepo: nodejs
