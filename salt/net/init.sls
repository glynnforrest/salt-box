wget:
    pkg.installed

{% if grains['os'] == 'MacOS' %}
{% set ran_bin = 'ran_darwin_amd64' %}
{% set ran_sha = '24e6d5e2775396843fc689dbe7d52fd5919262e4' %}
{% else %}
{% set ran_bin = 'ran_linux_amd64' %}
{% set ran_sha = 'b88f512f7cacf508b9290989be1b50da21b6dfbc' %}
{% endif %}

{% set ran_src = 'https://github.com/m3ng9i/ran/releases/download/v0.1.3/' ~ ran_bin ~ '.zip' %}
ran_http_server:
    archive.extracted:
        - name: /tmp/ran-http
        - enforce_toplevel: False
        - source: {{ran_src}}
        - source_hash: {{ran_sha}}
    file.managed:
        - name: /usr/local/bin/ran
        - source: /tmp/ran-http/{{ran_bin}}
        - mode: 0755
        - require:
            - archive: ran_http_server
