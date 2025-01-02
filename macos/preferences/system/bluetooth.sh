#!/bin/bash
#
# Bluetooth preferences.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_subheader "Bluetooth"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "defaults write com.apple.BluetoothAudioAgent 'Apple Bitpool Max (editable)' -int 80 && \
          defaults write com.apple.BluetoothAudioAgent 'Apple Bitpool Min (editable)' -int 80 && \
          defaults write com.apple.BluetoothAudioAgent 'Apple Initial Bitpool (editable)' -int 80 && \
          defaults write com.apple.BluetoothAudioAgent 'Apple Initial Bitpool Min (editable)' -int 80 && \
          defaults write com.apple.BluetoothAudioAgent 'Negotiated Bitpool' -int 80 && \
          defaults write com.apple.BluetoothAudioAgent 'Negotiated Bitpool Max' -int 80 && \
          defaults write com.apple.BluetoothAudioAgent 'Negotiated Bitpool Min' -int 80 && \
          defaults write com.apple.BluetoothAudioAgent 'Stream - Flush Ring on Packet Drop (editable)' -int 0 && \
          defaults write com.apple.BluetoothAudioAgent 'Stream - Max Outstanding Packets (editable)' -int 16 && \
          defaults write com.apple.BluetoothAudioAgent 'Stream Resume Delay' -float 0.75 && \
          defaults write bluetoothaudiod 'Enable AptX codec' -bool true && \
          defaults write bluetoothaudiod 'Enable AAC codec' -bool true && \
          defaults write bluetoothaudiod 'AAC Bitrate' -int 320 && \
          defaults write bluetoothaudiod 'AAC max packet size' -int 644" \
    "Increase sound quality for Bluetooth headsets"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Restart Bluetooth daemon.
  sudo pkill bluetoothd

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

}

main
