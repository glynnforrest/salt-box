# The top.sls file is for mapping roles to machines.
base:
  'my-laptop.local':
    - common
  'fqdn:vagrant-dev-box':
    - match: grain
    - common
