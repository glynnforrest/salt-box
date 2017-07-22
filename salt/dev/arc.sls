phab_libphutil:
  git.latest:
    - name: https://github.com/phacility/libphutil.git
    - target: /usr/local/opt/phabricator/libphutil
    - rev: master

phab_arcanist:
  git.latest:
    - name: https://github.com/phacility/arcanist.git
    - target: /usr/local/opt/phabricator/arcanist
    - rev: master
  file.symlink:
    - name: /usr/local/bin/arc
    - target: /usr/local/opt/phabricator/arcanist/bin/arc
