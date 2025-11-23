#!/bin/bash
#
# Keyboard preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Keyboard"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # (e.g. enable Tab in modal dialogs)

  execute "defaults write -g AppleKeyboardUIMode -int 2" \
    "Enable full keyboard access for all controls"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.HIToolbox AppleFnUsageType -int 2" \
    "Remap the emoji picker to the Fn key"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g KeyRepeat -int 2" \
    "Set blazing fast key repeat rate"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g InitialKeyRepeat -int 15 && \
          defaults write -g 'InitialKeyRepeat_Level_Saved' -int 15" \
    "Set blazing fast initial key repeat delay"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.BezelServices kDim -bool true" \
    "Automatically illuminate built-in MacBook keyboard in low light"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.BezelServices kDimTime -int 300" \
    "Turn off keyboard illumination when computer is not used for 5 minutes."

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g ApplePressAndHoldEnabled -bool false" \
    "Disable press-and-hold for keys in favor of key repeat"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSAutomaticCapitalizationEnabled -bool false" \
    "Disable automatic capitalization"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false" \
    "Disable automatic period substitution"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false" \
    "Disable smart quotes"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSAutomaticDashSubstitutionEnabled -bool false" \
    "Disable smart dashes"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSAutomaticCapitalizationEnabled -bool false " \
    "Disable automatic capitalization"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false" \
    "Disable auto-correct"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSAutomaticTextCompletionEnabled -bool false" \
    "Disable text-completion"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
