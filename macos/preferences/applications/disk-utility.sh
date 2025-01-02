#!/bin/bash
#
# Disk Utility preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Disk Utility"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true && \
          defaults write com.apple.DiskUtility advanced-image-options -bool true" \
    "Enable debug menu"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Disk Utility" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
