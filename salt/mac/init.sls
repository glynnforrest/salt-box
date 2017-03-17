{% set user = pillar['user'] %}

mac_fast_keys:
  cmd.run:
    - name: "defaults write NSGlobalDomain KeyRepeat -int 2 && defaults write NSGlobalDomain InitialKeyRepeat -int 15"
    - runas: {{user}}

# for user and login screen
mac_tap_to_click:
  cmd.run:
    - name: "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true && defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 && defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1"
    - runas: {{user}}

mac_screensaver_password:
  cmd.run:
    - name: "defaults write com.apple.screensaver askForPassword -int 1 && defaults write com.apple.screensaver askForPasswordDelay -int 0"
    - runas: {{user}}

mac_no_write_to_cloud:
  cmd.run:
    - name: "defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false"
    - runas: {{user}}

# default is 1hr
mac_24hr_standby:
  cmd.run:
    - name: 'pmset -a standbydelay 86400'

mac_no_boot_sound:
  cmd.run:
    - name: 'nvram SystemAudioVolume=" "'

mac_spectacle:
  cmd.run:
    - name: 'brew cask install spectacle'
    - unless: 'test -d /Applications/Spectacle.app'
    - runas: {{user}}
