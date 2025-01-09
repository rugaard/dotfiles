#!/bin/bash
#
# Finder preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Finder"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Note: doing so will also hide desktop icons

  execute "defaults write com.apple.finder QuitMenuItem -bool true" \
    "Allow quitting via ⌘ + Q"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.loginwindow TALLogoutSavesState -bool false && \
          defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false" \
    "Disable reopening windows when logging back in"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder DisableAllAnimations -bool true" \
    "Disable window animations and 'Get Info' animations"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder FXInfoPanesExpanded -dict General -bool true OpenWith -bool true Privileges -bool true" \
    "Expand the following 'File Info' panes; 'General', 'Open with' and 'Sharing & Permissions'"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false" \
    "Do not show internal hard drives on the desktop"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true" \
    "Show external hard drives on the desktop"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true" \
    "Show removable media on the desktop"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true && \
          defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true && \
          defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true" \
    "Automatically open a new Finder window when a volume is mounted"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder AppleShowAllFiles 'NO'" \
    "Do not show hidden files by default"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder _FXSortFoldersFirst -bool true" \
    "Keep folders on top when sorting by name"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder AppleShowAllExtensions -bool true" \
    "Show all filename extensions"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" \
    "Disable the warning when changing a file extension"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder ShowStatusBar -bool true" \
    "Show status bar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder ShowPathbar -bool true" \
    "Show path bar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.universalaccess showWindowTitlebarIcons -bool true" \
    "Show icon in title bar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder _FXShowPosixPathInTitle -bool false" \
    "Do not use full POSIX path as window title"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder QLEnableTextSelection -bool true" \
    "Allow text selection in Quick Look"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
    "Search the current directory by default"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'" \
    "Use list view in all Finder windows by default"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder NewWindowTarget -string 'PfDe' && \
          defaults write com.apple.finder NewWindowTargetPath -string 'file://${HOME}/'" \
    "Set '~/' as the default location for new Finder windows"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g com.apple.springing.enabled -bool true" \
    "Enable spring loading for directories"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g com.apple.springing.delay -float 0" \
    "Remove the spring loading delay for directories"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder ShowRecentTags -bool false" \
    "Do not show 'Recent tags'"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true" \
    "Enable AirDrop over every interface."

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -string true" \
    "Avoid creating '.DS_Store' files on network volumes"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true" \
    "Avoid creating '.DS_Store' files on USB drives"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.frameworks.diskimages skip-verify -bool true && \
          defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true && \
          defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true" \
    "Disable disk image verification"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder WarnOnEmptyTrash -bool false" \
    "Disable warning before emptying the Trash"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.finder EmptyTrashSecurely -bool true" \
    "Empty Trash securely by default"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "chflags nohidden '${HOME}/Library' && xattr -d com.apple.FinderInfo '${HOME}/Library' 2> /dev/null || true" \
    "Show the '~/Library' folder"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo chflags nohidden /Volumes" \
    "Show the /Volumes folder"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Finder" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
