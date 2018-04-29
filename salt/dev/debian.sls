dev_debian_pkgs:
  pkg.latest:
    - names:
      - apt-transport-https
      - zsh
      - vim
      - g++
      - imagemagick

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

{% set global_src = 'https://ftp.gnu.org/pub/gnu/global/global-6.6.tar.gz' %}
{% set global_hash = '0965b4800686641a28f7b16bb733aa3345316dde' %}
dev_debian_global:
  pkg.installed:
    - names:
      - exuberant-ctags
      - libncurses5-dev
  archive.extracted:
    - name: /tmp/global
    - source: {{global_src}}
    - source_hash: {{global_hash}}
    - unless: which global
  cmd.run:
    - name: './configure --with-exuberant-ctags=/usr/bin/ctags-exuberant && make && make install'
    - cwd: '/tmp/global/global-6.6'
    - unless: which global

dev_debian_fzf:
  archive.extracted:
    - name: /tmp/fzf
    - source: https://github.com/junegunn/fzf-bin/releases/download/0.17.3/fzf-0.17.3-linux_amd64.tgz
    - source_hash: '36a0cea94d2571729b0117ad51e3df8b99b8b86a'
    - enforce_toplevel: False
    - unless: which fzf
  file.managed:
    - name: /usr/local/bin/fzf
    - source: /tmp/fzf/fzf
    - mode: 0755
    - unless: which fzf
    - require:
      - archive: dev_debian_fzf

dev_debian_fasd:
  git.latest:
    - name: https://github.com/clvv/fasd.git
    - rev: master
    - target: /tmp/fasd
    - unless: which fasd
  cmd.run:
    - name: 'make install'
    - cwd: /tmp/fasd
    - unless: which fasd
    - require:
      - git: dev_debian_fasd
