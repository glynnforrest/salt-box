{% set user = pillar['user'] %}
{% set repos_file = ('/Users/'~user if grains['os'] == 'MacOS' else '/home/'~user) ~ '/.repos.json' %}
{% set repos = salt['pillar.get']('code:repos', []) %}

{% for repo in repos %}
checkout_{{repo.url}}:
  git.latest:
    - name: {{repo.url}}
    - user: {{user}}
    - target: {{repo.target}}
    - unless: 'test -d {{repo.target}}'
{% endfor %}

note_cloned_repos:
  file.managed:
    - name: {{repos_file}}
    - contents: '{{repos | json }}'
