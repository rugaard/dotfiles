#!/bin/bash
#
# Install Quick Look addons.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_header "Install Quick Look addons"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Make sure QuickLook folder exists

  mkd "${HOME}/Library/QuickLook" "Create QuickLook directory" && \
  sudo chown -R "${USER}":staff "${HOME}/Library/QuickLook"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview ZIP files" "betterzip"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview the contents of a standard Apple installer package" "suspicious-package"
}

main "$@"
