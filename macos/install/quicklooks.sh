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

  brew_install_cask "Preview AVIF images" "avifquicklook"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview WebP images" "webpquicklook"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview plain text files without or with unknown file extension" "qlstephen"

  # execute "xattr -cr ~/Library/QuickLook/QLStephen.qlgenerator" \
  #   "Fix 'qlstephen' not being able to open due to unverified developer."

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview source code files with syntax highlighting" "qlcolorcode"

  # execute "xattr -cr ~/Library/QuickLook/QLColorCode.qlgenerator" \
  #   "Fix 'QLColorCode' not being able to open due to unverified developer."

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview Markdown files" "qlmarkdown"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview JSON files" "quicklook-json"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview GeoJSON and TopoJSON files" "quickgeojson"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview .patch files" "qlprettypatch"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview CSV files" "quicklook-csv"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview ZIP files" "betterzip"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview Swift files" "qlswift"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview the contents of a standard Apple installer package" "suspicious-package"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Preview iOS / macOS app and provision information" "provisionql"
}

main "$@"
