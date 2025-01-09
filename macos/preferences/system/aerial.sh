#!/bin/bash
#
# Aerial preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Aerial"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write ${HOME}/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/com.JohnCoates.Aerial.plist \
          firstTimeSetup -int 1" \
    "Disable setup walkthrough"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write ${HOME}/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/com.JohnCoates.Aerial.plist \
          fadeMode -int 1" \
    "Enable fade in/out"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write ${HOME}/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/com.JohnCoates.Aerial.plist \
          intVideoFormat -int 3" \
    "Set video format to 4K"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write ${HOME}/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/com.JohnCoates.Aerial.plist \
          intOnBatteryMode -int 2" \
    "Disable when battery is below 20%"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write ${HOME}/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/com.JohnCoates.Aerial.plist \
          newViewingMode -int 1" \
    "Set viewing mode to 'cloned'"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write ${HOME}/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/com.JohnCoates.Aerial.plist \
          timeMode -int 3" \
    "Aligns scenes with system dark mode"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write ${HOME}/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/com.JohnCoates.Aerial.plist \
          enableManagement -int 1" \
    "Enable dynamic rotation of cache"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write ${HOME}/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/com.JohnCoates.Aerial.plist \
          intCachePeriodicity -int 2" \
    "Rotate cache every month"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write ${HOME}/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/com.JohnCoates.Aerial.plist \
          cacheLimit -int 20" \
    "Limit cache size (20 GB)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write ${HOME}/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/com.JohnCoates.Aerial.plist \
          showBackgroundDownloads -int 1" \
    "Show download progress on screen saver"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write ${HOME}/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/com.JohnCoates.Aerial.plist \
          debugMode -bool false" \
    "Deactivate debug mode and logs"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
