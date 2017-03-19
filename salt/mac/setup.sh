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

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# top left starts screensaver
defaults write com.apple.dock wvous-tl-corner -int 5
defaults write com.apple.dock wvous-tl-modifier -int 0

# don't save to cloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# default is 1hr
sudo pmset -a standbydelay 86400

# disable boot sound
sudo nvram SystemAudioVolume=" "

# auto hide the dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0

# minimize windows into the application's icon
defaults write com.apple.dock minimize-to-application -bool false

# give minimized apps transparent icons
defaults write com.apple.dock showhidden -bool true

# reasonable size for dock icons
defaults write com.apple.dock tilesize -int 46

# restart the tweaked apps
for app in "cfprefsd" \
	"Dock" \
	"Finder" \
	"SystemUIServer"
do
    killall "${app}" &> /dev/null
done;

# success!
touch ~/.mac-setup
