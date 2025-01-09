#!/bin/bash
#
# Spotlight preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Spotlight"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search || true" \
    "Hide Spotlight tray-icon (and subsequent helper)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo mdutil -i off '/Volumes' && \
          sudo /usr/libexec/PlistBuddy -c 'Add :Exclusions: string /Volumes' /System/Volumes/Data/.Spotlight-V100/VolumeConfiguration.plist" \
    "Disable Spotlight indexing for any volume that gets mounted and has not been indexed before"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Yosemite-specific search results (remove them if you are using macOS 10.9 or older):
  # 	MENU_DEFINITION
  # 	MENU_CONVERSION
  # 	MENU_EXPRESSION
  # 	MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
  # 	MENU_WEBSEARCH             (send search queries to Apple)
  # 	MENU_OTHER

  execute "defaults write com.apple.spotlight orderedItems -array \
          '{"enabled" = 1;"name" = "APPLICATIONS";}' \
          '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
          '{"enabled" = 0;"name" = "DIRECTORIES";}' \
          '{"enabled" = 0;"name" = "PDF";}' \
          '{"enabled" = 0;"name" = "FONTS";}' \
          '{"enabled" = 0;"name" = "DOCUMENTS";}' \
          '{"enabled" = 0;"name" = "MESSAGES";}' \
          '{"enabled" = 0;"name" = "CONTACT";}' \
          '{"enabled" = 0;"name" = "EVENT_TODO";}' \
          '{"enabled" = 0;"name" = "IMAGES";}' \
          '{"enabled" = 0;"name" = "BOOKMARKS";}' \
          '{"enabled" = 0;"name" = "MUSIC";}' \
          '{"enabled" = 0;"name" = "MOVIES";}' \
          '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
          '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
          '{"enabled" = 0;"name" = "SOURCE";}' \
          '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
          '{"enabled" = 0;"name" = "MENU_OTHER";}' \
          '{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
          '{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
          '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
          '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'" \
    "Change indexing order and disable some search results"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "killall mds &> /dev/null || true && \
          sudo mdutil -i on / > /dev/null && \
          sudo mdutil -E / > /dev/null" \
    "Enable and rebuild index from scratch"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
