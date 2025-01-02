#!/bin/bash
#
# iTerm preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "iTerm"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.googlecode.iterm2 PrefsCustomFolder -string '${HOME}/Library/Mobile Documents/com~apple~CloudDocs/Dotfiles/Applications/iTerm'" \
    "Sync settings from iCloud"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.googlecode.iterm2 SUEnableAutomaticChecks -bool true" \
    "Automatically check for new versions"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.googlecode.iterm2 PromptOnQuit -bool false" \
    "Don't display the annoying prompt when quitting"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.googlecode.iterm2 OnlyWhenMoreTabs -bool false" \
    "Don't display the annoying prompt when closing window with mulitple tabs"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.googlecode.iterm2 FocusFollowsMouse -bool true" \
    "Focus follows the mouse in the window"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.googlecode.iterm2 AllowClipboardAccess -bool true" \
    "Allow access to pasteboard"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.googlecode.iterm2 DisableFullscreenTransparency -bool true" \
    "Disable transparency in full screen"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "iTerm" &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "\n"

}

main "$@"
