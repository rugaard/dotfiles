#!/bin/bash
#
# Contacts preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Contacts"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.AddressBook ABUse21vCardFormat -bool false" \
    "Use vCard 3.0"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.AddressBook ABNameDisplay -bool false && \
          defaults write NSGlobalDomain NSPersonNameDefaultDisplayNameOrder -int 1" \
    "Show first name before last name"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.AddressBook ABNameSortingFormat -string 'sortingFirstName sortingLastName'" \
    "Sort by first name"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.AddressBook ABShortNameStyle -int 1" \
    "Short name format"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.AddressBook ABShortNamePrefersNickname -bool true && \
          defaults write NSGlobalDomain NSPersonNameDefaultShouldPreferNicknamesPreference -bool true" \
    "Prefer nicknames"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.AddressBook ABDefaultAddressCountryCode -string 'dk'" \
    "Set Denmark as default country code for addresses"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.AddressBook ABPrivateVCardFieldsEnabled -bool true" \
    "Enable private me card"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.AddressBook ABIncludeNotesInVCard -bool false" \
    "Do not export notes in vCards"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.AddressBook ABIncludePhotosInVCard -bool false" \
    "Do not export photos in vCards"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.addressbook ABShowDebugMenu -bool true" \
    "Enable the debug menu in Contacts"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Contacts" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
