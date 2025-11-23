#!/bin/bash
#
# UI & UX preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "UI & UX"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true" \
    "Automatically switch between light and dark mode"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    execute "defaults write com.apple.Siri StatusMenuVisible -bool false && \
            defaults write com.apple.assistant.support \"Assistant Enabled\" -bool false" \
      "Disable Siri"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#  local currentUserUID="CBUser-$(dscl . -read ~ GeneratedUID | sed 's/GeneratedUID: //')"
#
#  execute "sudo /usr/libexec/PlistBuddy -c 'Set :$currentUserUID:CBBlueLightReductionCCTTargetRaw 3269.201' /var/root/Library/Preferences/com.apple.CoreBrightness.plist && \
#          sudo /usr/libexec/PlistBuddy -c 'Set :$currentUserUID:CBBlueReductionStatus:AutoBlueReductionEnabled 1' /var/root/Library/Preferences/com.apple.CoreBrightness.plist && \
#          sudo /usr/libexec/PlistBuddy -c 'Set :$currentUserUID:CBBlueReductionStatus:BlueLightReductionAlgoOverride 0' /var/root/Library/Preferences/com.apple.CoreBrightness.plist && \
#          sudo /usr/libexec/PlistBuddy -c 'Set :$currentUserUID:CBBlueReductionStatus:BlueReductionAvailable 1' /var/root/Library/Preferences/com.apple.CoreBrightness.plist && \
#          sudo /usr/libexec/PlistBuddy -c 'Set :$currentUserUID:CBBlueReductionStatus:BlueReductionEnabled 1' /var/root/Library/Preferences/com.apple.CoreBrightness.plist && \
#          sudo /usr/libexec/PlistBuddy -c 'Set :$currentUserUID:CBBlueReductionStatus:BlueReductionMode 1' /var/root/Library/Preferences/com.apple.CoreBrightness.plist && \
#          sudo /usr/libexec/PlistBuddy -c 'Set :$currentUserUID:CBBlueReductionStatus:BlueReductionSunScheduleAllowed 1' /var/root/Library/Preferences/com.apple.CoreBrightness.plist" \
#    "Enable night shift from sunset to sunrise"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write NSGlobalDomain com.apple.sound.beep.feedback -integer 1" \
    "Enable beep feedback when changing volume"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.PowerChime ChimeOnAllHardware -bool true" \
    "Enable beep feedback plugging in the power adapter"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults -currentHost write com.apple.controlcenter Bluetooth -int 18" \
    "Show Bluetooth icon in the menu bar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults -currentHost write com.apple.controlcenter Sound -int 18" \
    "Show Volume icon in the menu bar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.menuextra.clock DateFormat -string 'EEE d. MMM  HH.mm'" \
    "Show date and day of week in the menu bar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.menuextra.clock Show24Hour -bool true" \
    "Use 24 hour clock"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo systemsetup -settimezone 'Europe/Copenhagen' > /dev/null && \
          sudo systemsetup -setnetworktimeserver 'time.euro.apple.com' && \
          sudo systemsetup -setusingnetworktime on" \
    "Set 'Copenhagen' as timezone and use Apples time server."

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g 'com.apple.sound.uiaudio.enabled' -int 0" \
    "Enable user interface sound effects"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g 'com.apple.sound.beep.feedback' -int 0" \
    "Enable feedback when volume is changed"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.menuextra.battery ShowPercent -string 'YES'" \
    "Show battery percentage from the menu bar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g ApplePersistence -bool false" \
    "Disable reopen on restarts"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.CrashReporter UseUNC 1" \
    "Make crash reports appear as notifications"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
    "Disable 'Are you sure you want to open this application?' dialog"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.loginwindow GuestEnabled -bool false && \
          defaults write com.apple.AppleFileServer guestAccess -bool false && \
          defaults write com.apple.smb.server AllowGuestAccess -bool false" \
    "Disable guest login"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.loginwindow PowerOffDisabled -bool false" \
    "Show 'Shut Down' button on login screen"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true" \
    "Show language menu in the top right corner of the boot screen"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo -string 'HostName'" \
    "Show IP address, hostname, OS version, etc. when clicking the clock on boot screen"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSNavPanelExpandedStateForSaveMode -bool true && \
          defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true" \
    "Expand save panel by default"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g PMPrintingExpandedStateForPrint -bool true && \
          defaults write -g PMPrintingExpandedStateForPrint2 -bool true" \
    "Expand print panel by default"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
    "Automatically quit the printer app once the print jobs are completed"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.screencapture disable-shadow -bool true" \
    "Disable shadow in screenshots"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.screencapture show-thumbnail -bool false" \
    "Do not show thumbnail"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.screencapture location -string '${HOME}/Desktop'" \
    "Save screenshots to the Desktop"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.screencapture type -string 'png'" \
    "Save screenshots as PNGs"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g CGFontRenderingFontSmoothingDisabled -bool false" \
    "Enable subpixel anti-aliasing (font-smoothing)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g AppleFontSmoothing -int 1" \
    "Enable subpixel font rendering on non-Apple LCDs"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true" \
    "Enable HiDPI display modes"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSScrollViewRubberbanding -int 0" \
    "Disable elastic rubber band scrolling"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g AppleShowScrollBars -string 'Always'" \
    "Always show scrollbars"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSDisableAutomaticTermination -bool true" \
    "Disable automatic termination of inactive apps"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSTableViewDefaultSizeMode -int 2" \
    "Set sidebar icon size to medium"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -r -domain local -domain system -domain user && \
          killall Finder && \
          killall Dock" \
    "Remove duplicates in the “Open With” menu"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSTextShowsControlCharacters -bool true" \
    "Display ASCII control characters using caret notation in standard text views"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSWindowResizeTime -float 0.001" \
    "Accelerated playback when adjusting the window size."

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g QLPanelAnimationDuration -float 0" \
    "Disable opening a Quick Look window animations."

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.helpviewer DevMode -bool true" \
    "Set Help Viewer windows to non-floating mode"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSUseAnimatedFocusRing -bool false" \
    "Disable the over-the-top focus ring animation"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g NSToolbarTitleViewRolloverDelay -float 0" \
    "Adjust toolbar title rollover delay"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false" \
    "Disable resume system-wide"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
          sudo defaults write '${domain}' dontAutoLoad -array \
              '/System/Library/CoreServices/Menu Extras/TimeMachine.menu' \
              '/System/Library/CoreServices/Menu Extras/Volume.menu'
          done && \
          sudo defaults write com.apple.systemuiserver menuExtras -array \
              '/System/Library/CoreServices/Menu Extras/Bluetooth.menu' \
              '/System/Library/CoreServices/Menu Extras/AirPort.menu' \
              '/System/Library/CoreServices/Menu Extras/Battery.menu' \
              '/System/Library/CoreServices/Menu Extras/Clock.menu'
          " \
    "Hide Time Machine and Volume icons from the menu bar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "SystemUIServer" &> /dev/null

}

main
