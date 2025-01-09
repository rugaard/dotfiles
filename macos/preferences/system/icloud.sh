#!/bin/bash
#
# iCloud preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "iCloud"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "ln -f -s '${HOME}/Library/Mobile Documents/com~apple~CloudDocs' '${HOME}/iCloud'" \
    "Add iCloud Drive shortcut in home directory"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false" \
    "Save to disk (not to iCloud) by default"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g FXEnableRemoveFromICloudDriveWarning -bool false" \
    "Do not show warning before removing from iCloud Drive"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults -currentHost write com.apple.coreservices.useractivityd 'ActivityAdvertisingAllowed' -bool true && \
          defaults -currentHost write com.apple.coreservices.useractivityd 'ActivityReceivingAllowed' -bool true" \
    "Allow Handoff between this Mac and iCloud devices"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
