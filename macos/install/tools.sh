#!/bin/bash
#
# Install command line tools.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_header "Install command line tools"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install "cURL" "curl"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install "FFmpeg" "ffmpeg"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install "GPG" "gpg"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install "Pinentry" "pinentry-mac"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install "sed (GNU)" "gnu-sed"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install "Terminal Notifier" "terminal-notifier"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install "wget" "wget"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install "YouTube Downloader" "yt-dlp"

}

main "$@"
