#!/bin/bash
#
# SSD-specific preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "SSD-specific Tweaks"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo pmset -a hibernatemode 0 && \
          sudo pmset -a autopoweroff 0 && \
          sudo pmset -a standby 0" \
    "Disable hibernation, standby and autopoweroff"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo pmset -a sms 0" \
    "Disable the sudden motion sensor as it’s not useful for SSDs"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
