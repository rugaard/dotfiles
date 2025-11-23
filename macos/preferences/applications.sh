#!/bin/bash
#
# Configure macOS application preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" && \
  . "../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_header "Application preferences"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./applications/activity-monitor.sh
  ./applications/alfred.sh
  ./applications/app-store.sh
  ./applications/calendar.sh
  ./applications/disk-utility.sh
  ./applications/firefox.sh
  ./applications/google-chrome.sh
  ./applications/iterm.sh
  ./applications/mail.sh
  ./applications/maps.sh
  ./applications/messages.sh
  ./applications/photos.sh
  ./applications/quicktime-player.sh
  ./applications/safari.sh
  ./applications/sizeup.sh
  ./applications/terminal.sh
  ./applications/textedit.sh
  ./applications/time-machine.sh
  ./applications/xcode.sh

}

main
