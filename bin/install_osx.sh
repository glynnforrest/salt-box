#!/bin/bash

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
