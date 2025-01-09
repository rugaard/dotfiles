#!/bin/bash
#
# Photos preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Photos"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true" \
    "Prevent Photos from opening automatically when devices are plugged in"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # execute "launchctl disable user/$UID/com.apple.photoanalysisd" \
  #   "Disable photo analysis daemon"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Photos" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
