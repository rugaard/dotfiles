#!/bin/bash
#
# Install cron jobs.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_header "Cron jobs"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_subheader "Install"

  hardlink "../cron/valet.plist" "${HOME}/Library/LaunchAgents/me.rugaard.valet.plist" "Check for newer version of Laravel Valet"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "Activate"

  execute "launchctl load me.rugaard.valet.plist" "Check for newer version of Laravel Valet"

}

main "$@"
