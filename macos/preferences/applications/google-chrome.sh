#!/bin/bash
#
# Google Chrome preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Google Chrome"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.google.Chrome ExtensionInstallSources -array 'https://*.github.com/*' 'http://userscripts.org/*'" \
    "Allow installing user scripts via GitHub or Userscripts.org"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false" \
    "Disable the all too sensitive backswipe on trackpads"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false" \
    "Disable the all too sensitive backswipe on Magic Mouse"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.google.Chrome DisablePrintPreview -bool true" \
    "Use the system-native print preview dialog"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true" \
    "Expand the print dialog by default"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Google Chrome" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
