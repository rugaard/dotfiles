#!/bin/bash
#
# Configure local settings.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r ICLOUD_DIRECTORY="${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Dotfiles"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  # Execute script on iCloud, which configures all local settings.

  if [[ -d "${ICLOUD_DIRECTORY}" ]] && [[ -f "${ICLOUD_DIRECTORY}/setup.sh" ]]; then

    print_in_white "\n   ---\n\n"

    \. "${ICLOUD_DIRECTORY}/setup.sh" "${DOTFILES_DIRECTORY}"

  fi

}

main
