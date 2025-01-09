#!/bin/bash
#
# Dashboard preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Dashboard"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dashboard dashboard-enabled-state -int 3" \
    "Enable Dashboard and show it as an overlay"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dashboard devmode -bool true" \
    "Enable Dashboard dev mode (allows keeping widgets on the desktop)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # 'killall Dashboard' doesn't actually do anything. To apply
  # the changes for Dashboard, 'killall Dock' is enough as `Dock`
  # is `Dashboard`'s parent process.

  killall "Dock" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
