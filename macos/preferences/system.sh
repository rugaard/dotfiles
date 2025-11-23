#!/bin/bash
#
# Configure macOS system preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_header "System preferences"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./system/bluetooth.sh
  ./system/dashboard.sh
  ./system/dock.sh
  ./system/energy-saving.sh
  ./system/finder.sh
  ./system/gatekeeper.sh
  ./system/icloud.sh
  ./system/keyboard.sh
  ./system/language-region.sh
  ./system/screen-saver.sh
  ./system/security-privacy.sh
  ./system/spotlight.sh
  ./system/ssd.sh
  ./system/trackpad-mouse.sh
  ./system/ui-ux.sh

}

main
