git:
    pkg.installed

{% for item in salt['pillar.get']('dotfiles:repos', []) %}
{{item['repo']}}:
    git.latest:
        - name: {{item['repo']}}
        - user: {{item['user']}}
        - target: {{item['target']}}

install_{{item['repo']}}:
    cmd.run:
        - name: {{item['run']}}
        - runas: {{item['user']}}
        - cwd: {{item['target']}}
        - require:
            - git: {{item['repo']}}
{% endfor %}
