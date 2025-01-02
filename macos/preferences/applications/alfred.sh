#!/bin/bash
#
# Alfred preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Alfred"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.runningwithcrayons.Alfred-Preferences syncfolder -string '${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Dotfiles/Alfred'" \
    "Sync settings from iCloud"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Alfred" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main "${@}"
