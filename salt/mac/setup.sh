#!/usr/bin/env bash

set -e

# pretty quick key repeats
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# tap to click, for user and login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# immediate password on screensaver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# don't save to cloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# default is 1hr
sudo pmset -a standbydelay 86400

# disable boot sound
sudo nvram SystemAudioVolume=" "

# success!
touch ~/.mac-setup
