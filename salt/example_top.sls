# The top.sls file is for mapping states to machines. Create top.sls
# and add states for the target hosts. Some examples are below.
base:
  '*':
    - common
  'my-laptop.local':
    - php
  'fqdn:vagrant-dev-box':
    - match: grain
    - php
    - apache
