#!/bin/bash
#
# Activity Monitor preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Activity Monitor"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ActivityMonitor OpenMainWindow -bool true" \
    "Show the main window on launch"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ActivityMonitor ShowCategory -int 100" \
    "Show all processes"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ActivityMonitor SortColumn -string 'CPUUsage' && \
          defaults write com.apple.ActivityMonitor SortDirection -int 0" \
    "Sort results by CPU usage"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ActivityMonitor 'UserColumnsPerTab v5.0' -dict \
          '0' '( Command, CPUUsage, CPUTime, Threads, IdleWakeUps, PID, UID )' \
          '1' '( Command, anonymousMemory, compressedMemory, ResidentSize, PurgeableMem, Threads, Ports, PID, UID)' \
          '2' '( Command, PowerScore, 12HRPower, AppSleep, graphicCard, UID )' \
          '3' '( Command, bytesWritten, bytesRead, Architecture, PID, UID )' \
          '4' '( Command, txBytes, rxBytes, txPackets, rxPackets, PID, UID )'" \
    "Set columns for each tab"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ActivityMonitor UserColumnSortPerTab -dict \
          '0' '{ direction = 0; sort = CPUUsage; }' \
          '1' '{ direction = 0; sort = ResidentSize; }' \
          '2' '{ direction = 0; sort = 12HRPower; }' \
          '3' '{ direction = 0; sort = bytesWritten; }' \
          '4' '{ direction = 0; sort = txBytes; }'" \
    "Sort columns in each tab"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ActivityMonitor UpdatePeriod -int 2" \
    "Set update frequency"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ActivityMonitor DiskGraphType -int 1" \
    "Show data in the Disk graph (instead of IO)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ActivityMonitor NetworkGraphType -int 1" \
    "Show data in the Network graph (instead of packets)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.ActivityMonitor IconType -int 5" \
    "Visualize CPU usage in the Dock icon"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  killall "Activity Monitor" &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
