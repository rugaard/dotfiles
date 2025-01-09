#!/bin/bash
#
# Dock preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Dock"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock autohide -bool true" \
    "Automatically hide/show the Dock"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock autohide-delay -float 0" \
    "Remove the auto-hiding Dock delay"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
    "Enable spring loading for all Dock items"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock expose-animation-duration -float 0.1" \
    "Speed up Mission Control animations"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock expose-group-by-app -bool true" \
    "Group windows by application in Mission Control"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock mineffect -string 'scale'" \
    "Set window minimization animation to 'scale'"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock minimize-to-application -bool true" \
    "Reduce clutter by minimizing windows into their application icons"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock mru-spaces -bool false" \
    "Do not automatically rearrange spaces based on most recent use"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock persistent-apps -array && \
          defaults write com.apple.dock persistent-others -array " \
    "Wipe all app icons"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock show-process-indicators -bool true" \
    "Show indicator lights for open applications"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock static-only -bool true" \
    "Only show open applications in the Dock"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock show-recents -bool false" \
    "Do not show recent applications in Dock"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock showhidden -bool true" \
    "Make Dock icons of hidden applications translucent"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock tilesize -float 36" \
    "Set the icon size of Dock items to 36 pixels"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.Dock size-immutable -bool false" \
    "Lock dock size"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock magnification -bool true" \
    "Enable magnification on hover"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock largesize -float 72" \
    "Set magnification size of items"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock mouse-over-hilite-stack -bool true" \
    "Enable highlight hover effect for the grid view of a stack"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock launchanim -bool false" \
    "Don't animate opening applications"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock springboard-columns -int 10 && \
          defaults write com.apple.dock springboard-rows -int 4" \
    "Change layout of Launchpad"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock wvous-tr-corner -int 0" \
    "Disable top right hot corner"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock wvous-tl-corner -int 0" \
    "Disable top left hot corner"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock wvous-bl-corner -int 0" \
    "Disable bottom left hot corner"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dock wvous-br-corner -int 0" \
    "Disable bottom right hot corner"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "find '${HOME}/Library/Application Support/Dock' -name '*-*.db' -maxdepth 1 -delete" \
    "Reset Launchpad, but keep the desktop wallpaper intact"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo ln -sf '/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app' '/Applications/Simulator.app'" \
    "Add 'Simulator' to Launchpad"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Dock" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
