#!/bin/bash
#
# Terminal preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Terminal"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.terminal SecureKeyboardEntry -bool true" \
    "Enable Secure Keyboard Entry in Terminal.app"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.Terminal ShowLineMarks -int 0" \
    "Disable the annoying line marks"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.terminal FocusFollowsMouse -bool true" \
    "Focus follows the mouse in the window"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.terminal StringEncodings -array 4" \
    "Only use UTF-8"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "./terminal/set_terminal_theme.applescript && sleep 1" \
    "Load custom Terminal theme"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.Terminal 'Default Window Settings' -string 'Rugaard' && \
          defaults write com.apple.Terminal 'Startup Window Settings' -string 'Rugaard'" \
    "Set custom theme as default"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # If there is a Touch Bar, ensure the Touch ID is used when
  # `sudo` is required.

  if ioreg | grep -q "AppleEmbeddedOSSupportHost" && ! grep -q "pam_tid.so" "/etc/pam.d/sudo"; then
      execute "sudo sh -c 'echo \"auth sufficient pam_tid.so\" >> /etc/pam.d/sudo'" \
        "Use Touch ID to authenticate sudo"
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"
}

main
