#!/bin/bash
#
# Gatekeeper preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Gatekeeper"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # execute "sudo spctl --master-disable" \
  #   "Enable 'Anywhere' option for Gatekeeper"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool false" \
    "Prevent Gatekeeper from re-enabling itself after 30 days"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
