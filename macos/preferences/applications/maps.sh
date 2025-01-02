#!/bin/bash
#
# Maps preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Maps"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.Maps LastClosedWindowViewOptions '{
              localizeLabels = 1;
              mapType = 11;
              trafficEnabled = 0;
          }'" \
    "Set view options"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Maps" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
