{% set user = pillar['user'] %}
{% set repos = salt['pillar.get']('code:repos', []) %}

{% for repo in repos %}
checkout_{{repo.url}}:
  git.latest:
    - name: {{repo.url}}
    - user: {{user}}
    - target: {{repo.target}}
    - unless: 'test -d {{repo.target}}'
{% endfor %}
