dev_debian_pkgs:
  pkg.latest:
    - names:
      - apt-transport-https
      - zsh
      - vim

dev_debian_rg:
  archive.extracted:
    - name: /tmp/ripgrep
    - source: https://github.com/BurntSushi/ripgrep/releases/download/0.7.1/ripgrep-0.7.1-x86_64-unknown-linux-musl.tar.gz
    - source_hash: 'a82447270183deefed44cfeed29b43915b199c93'
    - enforce_toplevel: True
    - unless: 'which rg'
  file.managed:
    - name: /usr/local/bin/rg
    - source: /tmp/ripgrep/ripgrep-0.7.1-x86_64-unknown-linux-musl/rg
    - mode: 0755
    - unless: 'which rg'
    - require:
      - archive: dev_debian_rg
