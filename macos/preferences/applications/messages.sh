#!/bin/bash
#
# Messages preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Messages"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add 'automaticEmojiSubstitutionEnablediMessage' -bool false" \
    "Disable automatic emoji substitution"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add 'automaticQuoteSubstitutionEnabled' -bool false" \
    "Disable smart quotes as it's annoying for messages that contain code"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add 'continuousSpellCheckingEnabled' -bool false" \
    "Disable continuous spell checking"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.iChat TextSize -int 2" \
    "Set text size"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.iChat ShowAllBuddyPictures -bool true" \
    "Show all buddy pictures in conversations"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.iChat AnimateBuddyPictures -bool true" \
    "Animate buddy pictures"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.messageshelper.AlertsController PlaySoundsKey -bool true" \
    "Play sound effects"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.messageshelper.AlertsController SOAlertsAddressMeKey -bool true" \
    "Notify me when my name is mentioned"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.messageshelper.AlertsController NotifyAboutKnockKnockKey -bool true" \
    "Notify me about messages form unknown contacts"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Messages" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
