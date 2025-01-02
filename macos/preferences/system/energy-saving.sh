#!/bin/bash
#
# Energy saving preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Energy saving"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo pmset -a lidwake 1" \
    "Enable lid wakeup"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo pmset -a autorestart 1" \
    "Restart automatically on power loss"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo systemsetup -setrestartfreeze on" \
    "Restart automatically if the computer freezes"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo pmset -a powernap 0" \
    "Disable Power Nap"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo pmset -a displaysleep 15" \
    "Sleep the display after 15 minutes"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo pmset -b sleep 5" \
    "Set machine sleep to 5 minutes on battery"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo pmset -c sleep 0" \
    "Disable machine sleep while charging"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo pmset -a standbydelay 1800" \
    "Set standby delay to 30 minutes (default is 1 hour)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo systemsetup -setcomputersleep 60 > /dev/null" \
    "Sleep after 1 hour of inactivity"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo pmset -a hibernatemode 0" \
    "Disable hibernation"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
