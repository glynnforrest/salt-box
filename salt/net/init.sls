net_wget:
    pkg.installed:
        - name: wget

{% if grains['os'] == 'MacOS' %}
{% set ran_bin = 'ran_darwin_amd64' %}
{% set ran_sha = '24e6d5e2775396843fc689dbe7d52fd5919262e4' %}
{% else %}
{% set ran_bin = 'ran_linux_amd64' %}
{% set ran_sha = 'b88f512f7cacf508b9290989be1b50da21b6dfbc' %}
{% endif %}

{% set ran_src = 'https://github.com/m3ng9i/ran/releases/download/v0.1.3/' ~ ran_bin ~ '.zip' %}
net_ran_http_server:
    archive.extracted:
        - name: /tmp/ran-http
        - enforce_toplevel: False
        - source: {{ran_src}}
        - source_hash: {{ran_sha}}
        - unless: which ran
    file.managed:
        - name: /usr/local/bin/ran
        - source: /tmp/ran-http/{{ran_bin}}
        - mode: 0755
        - unless: which ran
        - require:
            - archive: net_ran_http_server

net_http_status_helper:
    file.managed:
        - name: /usr/local/bin/http
        - source: 'https://raw.githubusercontent.com/gazayas/http/9e57fc9ef3c4b476fd8296e25918e6dce69fd94f/http'
        - source_hash: '07de12b4f69d612c7a529c529a86f747fa22a22b'
        - mode: 0755

net_nmap:
    pkg.installed:
        - name: nmap
