ld_wifi_driver:
  pkgrepo.managed:
    - name: deb http://ftp.uk.debian.org/debian/ stretch main contrib non-free
  pkg.installed:
    - name: firmware-iwlwifi


