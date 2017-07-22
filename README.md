# Salt Box

SaltStack states to your development machines, in the style of Github's boxen.

You need to provide your own top and pillar files:

* `salt/top.sls` to assign states to your different machines
* `pillar/top.sls` to assign pillar data
* any files declared in `pillar/top.sls`

These files aren't included in this repo, since they could contain private data.

Ideally, they would come from a private git repository which you could
symlink to.

Have a look at `salt/example_top.sls` and `pillar/example_top.sls` for
more information.

## Usage

### Initial setup

* Install git and clone this repository
* Run `./bin/install` to install and configure Salt
* Add `salt/top.sls`, `pillar/top.sls`, and any required pillar files to this repo
* Provision everything with `sudo salt-call state.highstate`

### Updating

* `git pull`
* Adjust your top files as needed
* `sudo salt-call state.highstate`

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

### office

Office programs (LibreOffice).

## Warning

These state files are designed for a development environment. The
configurations they set up are not designed to be secure.
