# Salt Box

SaltStack states for setting up your computer.

Two files are required:

* `salt/top.sls` to tell salt what states you want
* `pillar/config.sls` to configure them

Ideally, these files would come from a private git repository
somewhere, which you then symlink to.

## Usage

For a fresh install:

* Run the bootstrap script for your OS to install saltstack and clone this repo, e.g. `curl https://raw.githubusercontent.com/glynnforrest/salt-box/master/bin/install_mac.sh`
* Add `salt/top.sls` and `pillar/config.sls` to this repo.
* Run everything with `sudo salt-call state.highstate`.

## Supported platforms

* MacOS
* Debian

## Included states

### dev

Install some dev packages and optionally clone a dotfiles repo.

Also install iTerm2 on MacOS.

### mac

Setup some sensible defaults for MacOS.

### browsers

Common web browsers.

### emacs

Grab emacs and checkout a config.

### net

Tools for interacting with networks.

* wget
* ran - standalone miniature http server

## Warning

These state files are designed for a development environment. The
configurations they set up are not designed to be secure.
