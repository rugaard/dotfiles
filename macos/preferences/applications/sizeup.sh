#!/bin/bash
#
# SizeUp preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "SizeUp!"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true" \
    "Start at login"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false" \
    "Don't show the preferences window on next start"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "SizeUp" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
