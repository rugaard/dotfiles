#!/bin/bash
#
# Install custom application icons.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare SIP_DISABLED=false
declare AUTHED_ROOT_DISABLED=false

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -a SYSTEM_APPLICATIONS=(
  "/System/Applications:App Store:AppIcon"
  "/System/Applications:Automator:AppIcon"
  "/System/Applications:Books:AppIcon"
  "/System/Applications:Calculator:AppIcon"
  "/System/Applications:Contacts:Contacts"
  "/System/Applications:Dictionary:AppIconLoc"
  "/System/Applications:FaceTime:AppIcon"
  "/System/Applications:FindMy:AppIcon"
  "/System/Library/CoreServices:Finder:Finder"
  "/Applications:FortiClient:electron"
  "/System/Applications:Font Book:AppIcon"
  "/System/Applications:Home:AppIcon"
  "/System/Applications:Mail:ApplicationIcon"
  "/System/Applications:Maps:AppIcon"
  "/System/Applications:Messages:AppIcon"
  "/System/Applications:Music:AppIcon"
  "/System/Applications:Notes:AppIcon"
  "/System/Applications:Photos:AppIcon"
  "/System/Applications:Podcasts:AppIcon"
  "/System/Applications:QuickTime Player:AppIcon"
  "/Applications:Safari:AppIcon"
  "/System/Applications:Shortcuts:AppIcon"
  "/System/Applications:Stickies:AppIcon"
  "/System/Applications/Utilities:Terminal:Terminal"
  "/System/Applications:VoiceMemos:MacAppIcon"
)

declare -a INSTALLED_APPLICATIONS=(
  "1Password:icon"
  "Firefox:firefox"
  "Google Chrome:app"
  "iTerm:AppIcon"
  "Microsoft Defender:AppIcon"
  "Microsoft Excel:XCEL"
  "Microsoft OneNote:OneNote"
  "Microsoft Outlook:Outlook"
  "Microsoft PowerPoint:PPT3"
  # "Microsoft Remote Desktop:AppIcon"
  "Microsoft Teams:icon"
  "Microsoft Word:MSWD"
  "Slack:electron"
  "Spotify:Icon"
  "Telegram:AppIcon"
  "The Unarchiver:AppIcon"
  "Transmission:AppIcon"
  "Visual Studio Code:Code"
  "VLC:VLC"
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

change_icon() {

  local path="$1"
  local application="$2"
  local iconName="$3"
  local iconType="$4"

  # Only change icon, if application is found.
  if [ ! -d "${path}/${application}.app" ]; then
    return 1;
  fi

  # Create backup of original icon.
  yes | sudo cp -i "${path}/${application}.app/Contents/Resources/${iconName}.icns" "${path}/${application}.app/Contents/Resources/${iconName}.icns.bak" > /dev/null 2>&1

  # Overwrite existing icon.
  yes | sudo cp "../../icons/${iconType}/${application}.icns" "${path}/${application}.app/Contents/Resources/${iconName}.icns" > /dev/null 2>&1

  # Touch application to update icon.
  sudo touch "${path}/${application}.app" > /dev/null 2>&1

  return 0
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  # Check the state of SIP and authenticated-root.

  is_sip_disabled && SIP_DISABLED=true
  is_authed_root_disabled && AUTHED_ROOT_DISABLED=true

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_header "Icons"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Array of applications to kill.
  local affectedApplications=()

  print_subheader "System applications"

  if ${SIP_DISABLED} && ${AUTHED_ROOT_DISABLED}; then
    # Change icons of system applications.
    for i in "${SYSTEM_APPLICATIONS[@]}"; do
      # Split icon to replace string
      IFS=":" read -r path application icon <<< "${i}"

      # Add application to kill array
      affectedApplications+=("${application}")

      # Change application icon
      change_icon "${path}" "${application}" "${icon}" "system"

      # Print result of icon change attempt.
      print_result $? "Change icon for ${application}"
    done
  else
    print_in_white "   You do not have the required permissions to auto-change system icons.\n"
    print_in_white "   Use the application "
    print_in_green "IconChamp"
    print_in_white " to change them manually.\n"
  fi

  printf "\n"

  print_subheader "Applications"

  # Change icons of installed applications.
  for i in "${INSTALLED_APPLICATIONS[@]}"; do
    # Split icon to replace string
    IFS=":" read -r application icon <<< "${i}"

    # Add application to kill array
    affectedApplications+=("${application}")

    # Change application icon
    change_icon "/Applications" "${application}" "${icon}" "applications"

    # Print result of icon change attempt.
    print_result $? "Change icon for ${application}"
  done

  # Reset icon service cache.
  sudo rm -rf /Library/Caches/com.apple.iconservices.store

  # Quit affected applications.
  for i in "${affectedApplications[@]}"; do
    [[ "${i}" == 'Terminal' || "${i}" == 'iTerm' ]] && continue
    osascript -e "quit app \"${i}\""  > /dev/null 2>&1
  done

  return 0
}

main "$@"
