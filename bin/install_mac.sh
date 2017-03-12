#!/bin/bash

git > /dev/null
echo
echo "Press return when Xcode CLI tools are installed, or hit C-c to cancel:"
echo
read

set -e

if hash brew 2>/dev/null; then
    echo "Homebrew already installed."
else
    echo "Homebrew not found, installing..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if hash salt-call 2>/dev/null; then
    echo "Saltstack already installed."
else
    echo "Saltstack not found, installing..."
    brew update
    brew install saltstack
fi

echo
read -e -p "Location to clone the salt-box repo (absolute paths only, don't use ~, e.g. /Users/glynn/code/salt-box): " SALTBOXDIR

mkdir -pv `dirname "$SALTBOXDIR"`

if test -d "$SALTBOXDIR"
then
    echo "Salt-box repo already cloned."
else
    git clone https://github.com/glynnforrest/salt-box "$SALTBOXDIR"
fi

read -e -p "Create a salt-minion config pointing to the salt-box repo? (y/n): " yn
if test "$yn" = "y"
then
    echo "Creating /etc/salt/minion pointing to salt-box directory..."

    sudo mkdir -p /etc/salt

    cat << EOF > _salt_minion
file_client: local
log_level: info
file_roots:
  base:
    - $SALTBOXDIR/salt
pillar_roots:
  base:
    - $SALTBOXDIR/salt
EOF

    sudo mv _salt_minion /etc/salt/minion
else
    echo "Skipping minion config."
fi

echo
echo "Running 'salt-call test.ping' to check salt is working..."
sudo salt-call test.ping

echo
echo "Now add a top.sls file, then run highstate!" 
echo
