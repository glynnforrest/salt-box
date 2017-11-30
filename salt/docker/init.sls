{% set user = pillar['user'] %}

docker:
    pkg.installed:
        - name: docker

docker_compose:
    pkg.installed:
        - name: docker-compose

{% if grains['os'] == 'MacOS' %}
docker-mac:
  cmd.run:
    - name: 'brew cask install docker'
    - unless: 'test -d /Applications/Docker.app'
    - runas: {{user}}
{% endif %}
