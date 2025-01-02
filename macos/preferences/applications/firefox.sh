#!/bin/bash
#
# Google Chrome preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Firefox"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write org.mozilla.firefox AppleEnableSwipeNavigateWithScrolls -bool false" \
    "Disable the all too sensitive backswipe on Magic Mouse"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Firefox" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
