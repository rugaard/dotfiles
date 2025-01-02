#!/bin/bash
#
# App Store preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "App Store"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo softwareupdate --schedule on && \
          defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true" \
    "Enable the automatic update check"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1" \
    "Check for software updates daily, not just once per week"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1" \
    "Download newly available updates in background"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1" \
    "Install System data files & security updates"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 0" \
    "Do not automatically download apps purchased on other Macs"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.commerce AutoUpdate -bool true" \
    "Turn on app auto-update"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.commerce AutoUpdateRestartRequired -bool true" \
    "Allow the App Store to reboot machine on macOS updates"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.AppStore AutoPlayVideoSetting -string 'off' && \
          defaults write com.apple.AppStore UserSetAutoPlayVideoSetting -int 1" \
    "Turn off video autoplay"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.appstore WebKitDeveloperExtras -bool true" \
    "Enable the WebKit Developer Tools"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.appstore ShowDebugMenu -bool true" \
    "Enable Debug Menu in the Mac App Store"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "App Store" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
