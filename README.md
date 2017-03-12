# Salt Box

Machine-agnostic salt states for setting up development environments.

These states intend to be as general as possible by default. No
machine-specific data is committed to this repository so it can be
safely used anywhere. Create `pillar/<hostname>.sls` files to add
specific configuration for different machines.

## Suggested usage

Here are some steps for a fresh install:

* Run the bootstrap script for your OS to install saltstack and clone this repo, e.g. `curl https://raw.githubusercontent.com/glynnforrest/salt-box/master/bin/install_mac.sh`
* Create `salt/top.sls`. Ideally, this would come from a private git repository somewhere (remember to get any required ssh keys), which you then symlink to.
* Run everything with `sudo salt-call state.highstate`.

Look in `pillar/defaults` for available settings. Override a setting
by placing it in `pillar/<hostname>.sls`.

## Supported platforms

* OSX
* Debian

## Included states

* Common - general settings and packages
* Apache
* Nodejs
* PHP

## Warning

These state files are designed for a development environment. The
configurations they set up are not designed to be secure.
