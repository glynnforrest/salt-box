Install emacs:
  pkg.installed:
    - name: {{salt['pillar.get']('emacs:pkg_name')}}

{% if salt['pillar.get']('emacs:repository') %}
Clone emacs git repository:
  git.latest:
    - name: {{ salt['pillar.get']('emacs:repository') }}
    - rev: master
    - target: ~/.emacs.d
{% endif %}
