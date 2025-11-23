#!/bin/bash
#
# Safari preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Safari"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.coreservices.uiagent CSUIHasSafariBeenLaunched -bool YES && \
          defaults write com.apple.coreservices.uiagent CSUIRecommendSafariNextNotificationDate -date 2050-01-01T00:00:00Z && \
          defaults write com.apple.coreservices.uiagent CSUILastOSVersionWhereSafariRecommendationWasMade -float 10.99 && \
          defaults write -app Safari DefaultBrowserDateOfLastPrompt -date '2050-01-01T00:00:00Z' && \
          defaults write -app Safari DefaultBrowserPromptingState -int 2" \
    "Don't nag about Safari"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari HomePage -string 'about:blank'" \
    "Set Safari start page to 'about:blank' for faster loading"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari SendDoNotTrackHTTPHeader -bool true" \
    "Enable 'Do Not Track'"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari UniversalSearchEnabled -bool false && \
          defaults write -app Safari SuppressSearchSuggestions -bool true" \
    "Don't send search queries to Apple"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari BlockStoragePolicy -int 2 && \
          defaults write -app Safari WebKitStorageBlockingPolicy -int 1 && \
          defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2StorageBlockingPolicy' -int 1" \
    "Cookie and website data policy"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebKitPreferences.tabFocusesLinks -bool true && \
          defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks' -bool true" \
    "Press Tab to highlight each item on a web page"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled' -bool true" \
    "Allow hitting the Backspace key to go to the previous page in history"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebContinuousSpellCheckingEnabled -bool false" \
    "Disable continuous spellchecking"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebAutomaticSpellingCorrectionEnabled -bool false" \
    "Disable auto-correct"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari AutoFillFromAddressBook -bool false && \
          defaults write -app Safari AutoFillPasswords -bool false && \
          defaults write -app Safari AutoFillCreditCardData -bool false && \
          defaults write -app Safari AutoFillMiscellaneousForms -bool false" \
    "Disable AutoFill"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebKitPluginsEnabled -bool false && \
          defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled' -bool false" \
    "Disable plug-ins"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2PlugInSnapshottingEnabled' -bool true" \
    "Disable plug-ins ability to create snapshots"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebKitJavaEnabled -bool false && \
          defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled' -bool false && \
          defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles' -bool false" \
    "Disable Java"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebKitJavaScriptEnabled -bool true && \
          defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptEnabled' -bool true" \
    "Enable JavaScript"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebKitMediaPlaybackAllowsInline -bool false" \
    "Disable auto-playing video"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false && \
          defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically' -bool false" \
    "Block pop-up windows"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari InstallExtensionUpdatesAutomatically -bool true" \
    "Update extensions automatically"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari ShowFullURLInSmartSearchField -bool true" \
    "Show the full URL in the address bar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari ShowStatusBar -bool true && \
          defaults write -app Safari ShowOverlayStatusBar -bool true && \
          defaults write -app Safari ShowStatusBarInFullScreen -bool true" \
    "Show status bar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebKitMinimumFontSize -int 9 && \
          defaults write -app Safari 'WebKitPreferences.minimumFontSize' -int 9" \
    "Set minimum allowed font size"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WarnAboutFraudulentWebsites -bool true" \
    "Warn about fraudulent websites"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari AlwaysRestoreSessionAtLaunch -bool true && \
          defaults write -app Safari OpenPrivateWindowWhenNotRestoringSessionAtLaunch -bool false" \
    "Always open with windows/tabs from last session"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari NewTabBehavior -int 4 && \
          defaults write -app Safari NewWindowBehavior -int 4" \
    "New tabs and windows always open on start page."

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari TabCreationPolicy -int 2" \
    "Always open pages in a tab"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari AlwaysShowTabBar -bool true" \
    "Always show tab bar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari OpenNewTabsInFront -bool false" \
    "Always focus newly created tab or window"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari CommandClickMakesTabs -bool true" \
    "Enable ⌘ + clicking a link opens a new tab"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari Command1Through9SwitchesTabs -bool true" \
    "Enable ⌘ + 1 through ⌘ + 9 to switch tabs"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari NeverUseBackgroundColorInToolbar -bool true" \
    "Never use colored tabs"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari ShowFavoritesBar -bool false && \
          defaults write -app Safari ShowFavoritesBar-v2 -bool false" \
    "Hide bookmarks bar by default"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari SidebarViewModeIdentifier -string  'Bookmarks'" \
    "Set sidebar mode"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari ShowSidebarInNewWindows -bool true" \
    "Show sidebar in new windows"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari ShowSidebarInTopSites -bool true" \
    "Show sidebar in top sites"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari TopSitesGridArrangement -int 0" \
    "Only show 6 top sites"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari PreloadTopHit -bool false" \
    "Disable preloading top hit in background"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari DebugSnapshotsUpdatePolicy -int 2" \
    "Disable thumbnail cache for History and Top Sites"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebKitInitialTimedLayoutDelay 0.25" \
    "Disable the standard delay in rendering a web page."

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari ProxiesInBookmarksBar '()'" \
    "Remove useless icons from bookmarks bar"

  execute "defaults write com.apple.Safari EnableEnhancedPrivacyInPrivateBrowsing -bool true &&
          defaults write com.apple.Safari EnableEnhancedPrivacyInRegularBrowsing -bool true " \
    "Use advanced tracking and fingerprinting protection in all browsing."

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari FindOnPageMatchesWordStartsOnly -bool false" \
    "Make search banners default to 'Contains' instead of 'Starts With'"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebKitDefaultTextEncodingName -string 'utf-8' &&
          defaults write -app Safari WebKitPreferences.defaultTextEncodingName -string 'utf-8'" \
    "Set default encoding"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari DownloadsPath -string '${HOME}/Downloads'" \
    "Set download folder"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari SavePanelFileFormat -int 0" \
    "Save web pages as page source"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari DownloadsClearingPolicy -int 2" \
    "Remove downloads from list upon successful download"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari AutoOpenSafeDownloads -bool false" \
    "Prevent opening 'safe' files automatically after downloading"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari SafariGeolocationPermissionPolicy -int 0" \
    "Only allow website to prompt for location services one time"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari CanPromptForPushNotifications -bool false" \
    "Deny websites to ask for permission to send push notifications"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2ApplePayCapabilityDisclosureAllowed' -bool true" \
    "Allow checking for Apple Pay"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebsiteSpecificSearchEnabled -bool false" \
    "Allow website specific searches"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari PrintHeadersAndFooters -bool false" \
    "Do not print headers and footers"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari WebKitShouldPrintBackgroundsPreferenceKey -bool false && \
          defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2ShouldPrintBackgrounds' -bool false" \
    "Do not print backgrounds"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g WebKitDeveloperExtras -bool true && \
          defaults write -app Safari 'WebKitPreferences.developerExtrasEnabled' -bool true" \
    "Add a context menu item for showing the Web Inspector in web views"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari IncludeDevelopMenu -bool true && \
          defaults write -app Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
          defaults write -app Safari 'com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled' -bool true" \
    "Enable the Develop menu and the Web Inspector"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -app Safari IncludeInternalDebugMenu -bool true" \
    "Enable debug menu"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Safari" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
