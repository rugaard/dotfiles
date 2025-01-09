#!/bin/bash
#
# Xcode preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Xcode"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool true" \
    "Trim trailing whitespace"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true" \
    "Trim whitespace only lines"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dt.Xcode DVTTextShowCompletionsOnEsc -bool false" \
    "Don't show completion on escape"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dt.Xcode DVTTextShowLineNumbers -bool true" \
    "Show line numbers"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool true" \
    "Show the build duration in the toolbar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dt.Xcode IDEBuildingContinueBuildingAfterErrors -bool true" \
    "Continue building after errors"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dt.Xcode DVTDownloadableAutomaticUpdate -bool true" \
    "Enable automatic updates"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dt.Xcode IDEEnableLiveIssues -bool true" \
    "Enable live issues"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.dt.Xcode ShowDVTDebugMenu -bool true" \
    "Enable internal debug menu"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Xcode" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
