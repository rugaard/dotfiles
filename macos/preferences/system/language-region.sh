#!/bin/bash
#
# Language & Region preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Language & Region"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g AppleLanguages -array 'da-DK' 'da'" \
    "Set language"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g AppleLocale -string 'da_DK@currency=DKK'" \
    "Set locale"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "sudo systemsetup -settimezone 'Europe/Copenhagen'" \
    "Set timezone"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g AppleMeasurementUnits -string 'Centimeters'" \
    "Set measurement unit"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g AppleTemperatureUnit -string 'Celsius'" \
    "Set temperature unit"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write -g AppleMetricUnits -bool true" \
    "Use metric units"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
