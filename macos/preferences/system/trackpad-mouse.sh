#!/bin/bash
#
# Trackpad preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Trackpad & Mouse"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true && \
          defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1 && \
          defaults write -g com.apple.mouse.tapBehavior -int 1 && \
          defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1" \
    "Enable 'Tap to click'"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true && \
          defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1 && \
          defaults -currentHost write -g com.apple.trackpad.enableSecondaryClick -bool true && \
          defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0 && \
          defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0 && \
          defaults -currentHost write -g com.apple.trackpad.trackpadCornerClickBehavior -int 0" \
    "Map 'click or tap with two fingers' to the secondary click"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string TwoButton && \
          defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton" \
    "Enable secondary mouse click"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g com.apple.trackpad.scaling -int 5 && \
          defaults write -g com.apple.mouse.scaling -float 5" \
    "Increase tracking speed"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g com.apple.swipescrolldirection -bool true" \
    "Enable 'natural' scrolling"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
