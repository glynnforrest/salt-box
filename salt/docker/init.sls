docker:
    pkg.installed:
        - name: docker

docker_compose:
    pkg.installed:
        - name: docker-compose

{% for machine in salt['pillar.get']('docker:machines', []) %}
docker_machine_{{machine}}:
    cmd.run:
        - name: 'docker-machine create {{machine}} --virtualbox-memory 4096'
        - unless: 'docker-machine ls | grep -q {{machine}}'

# get junk like elasticsearch working
docker_machine_{{machine}}_setup:
    cmd.run:
        - name: 'docker-machine ssh {{machine}} "sudo sysctl -w vm.max_map_count=262144"'
        - unless: 'docker-machine ls | grep -q {{machine}}'
{% endfor %}
