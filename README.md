# Salt Box

Machine-agnostic salt states for setting up development environments.

These states intend to be as general as possible by default. No
machine-specific data is committed to this repository so it can be
safely used anywhere. Create `pillar/<hostname>.sls` files to add
specific configuration for different machines.

## Usage

These states are designed to be run without a master using
`salt-call`.

* Install salt using your package manager.
* Create `/etc/salt/minion`, pointing to the `salt` and `pillar` directories.
* Create `salt/top.sls` (take a look at `salt/example_top.sls`).
* Create `pillar/<hostname>.sls` for each machine.
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
