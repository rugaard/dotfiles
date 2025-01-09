#!/bin/bash
#
# Screen saver preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Screen saver"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults -currentHost write com.apple.screensaver idleTime -int 120" \
    "Start screen saver after 2 minutes of inactivity"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.screensaver askForPassword -int 1 && \
          defaults write com.apple.screensaver askForPasswordDelay -int 0" \
    "Require password immediately after into sleep or screen saver mode"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults -currentHost write com.apple.screensaver moduleDict -dict \
          moduleName -string "Aerial" \
          path -string '${HOME}/Library/Screen Savers/Aerial.saver' \
          type -int 0" \
    "Set 'Aerial' as active screen saver"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
