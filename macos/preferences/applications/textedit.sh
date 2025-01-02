#!/bin/bash
#
# TextEdit preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "TextEdit"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.TextEdit RichText -bool true" \
    "Use rich text mode for new documents"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.TextEdit PlainTextEncoding -int 4 && \
          defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4" \
    "Open and save documents as UTF-8"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "TextEdit" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
