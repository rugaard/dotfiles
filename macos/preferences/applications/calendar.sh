#!/bin/bash
#
# Calendar preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Calendar"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.iCal CalendarSidebarShown -bool true" \
    "Show sidebar with calendars"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.iCal 'Show Week Numbers' -bool true" \
    "Show week numbers"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ical 'first day of the week' 1" \
    "Week starts on Monday"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.iCal 'n days of week' -int 7" \
    "Set 7 days per week"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.iCal 'scroll by weeks in week view' -int 1" \
    "Scroll week view by one week"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ical 'first minute of work hours' 480" \
    "Day starts at 08:00"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ical 'first minute of work hours' 480" \
    "Day ends at 18:00"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.iCal 'number of hours displayed' -int 16" \
    "Show 16 hours at a time"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.iCal 'Show heat map in Year View' -bool true" \
    "Show events in year view"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.iCal 'TimeZone support enabled' -bool true" \
    "Enable timezone support"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.iCal WarnBeforeSendingInvitations -bool true" \
    "Ask before sending changes to events"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Calendar" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
