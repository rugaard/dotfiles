#!/bin/bash
#
# Time Machine preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Time Machine"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true" \
    "Prevent Time Machine from prompting to use new hard drives as backup volume"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo tmutil disable" \
    "Disable local Time Machine backups"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "tmutil listlocalsnapshotdates / |grep 20|while read f; do tmutil deletelocalsnapshots ${f}; done" \
    "Delete all local Time Machine snapshots"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Time Machine" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
