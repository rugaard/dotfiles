#!/bin/bash
#
# Mail preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Mail"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.mail EnableToCcInMessageList -bool true" \
    "Show To/Cc labels in message list"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false" \
    "Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>'"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.mail DisableInlineAttachmentViewing -bool false" \
    "Enable inline attachments"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.mail NSUserKeyEquivalents -dict-add 'Send' '@\U21a9'" \
    "Add the keyboard shortcut ⌘ + Enter to send an email"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.mail DisableSendAnimations -bool true && \
          defaults write com.apple.mail DisableReplyAnimations -bool true" \
    "Disable send and reply animations"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.mail DraftsViewerAttributes -dict-add 'DisplayInThreadedMode' -string 'yes' && \
          defaults write com.apple.mail DraftsViewerAttributes -dict-add 'SortedDescending' -string 'yes' && \
          defaults write com.apple.mail DraftsViewerAttributes -dict-add 'SortOrder' -string 'received-date'" \
    "Display emails in threaded mode, sorted by date (oldest at the top)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Mail" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
