# Pillar data is structured slightly differently than most saltstack
# configs to allow for a variable amount of hosts and to avoid
# changing this file. Default settings are given to all, which is
# then overridden with a host specific file. Create <hostname>.sls
# and copy or symlink it into this directory.

base:
  '*':
    - defaults.apache
    - defaults.common
    - defaults.php

    # host specific configuration
    # replacing '.' with '-' to avoid looking in subdirectories
    - {{ grains['nodename'] | replace ('.', '-')}}
