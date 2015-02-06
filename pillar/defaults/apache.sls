apache:
  pkg_name: apache2
  service_name: apache2
  use_php: false

  # Example virtual hosts
  # virtual_hosts:
  #   - { host: example.com, docroot: web }
  # Using symlinks
  # WARNING: the directory will be clobbered by the symlink if it exists
  #   - { host: example.org, docroot: web, symlink: /var/ftp/example.org }
