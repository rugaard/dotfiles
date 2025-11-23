#!/bin/bash
#
# Install applications.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_header "Install applications"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "1Password" "1password"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Alfred" "alfred"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "App Zapper" "appzapper"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "ChatGPT" "chatgpt"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Discord" "discord"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Firefox" "firefox"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Google Chrome" "google-chrome"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "iTerm 2" "iterm2"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install "Mac App Store CLI" "mas"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Postman" "postman"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Sequel Ace" "sequel-ace"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "SizeUp!" "sizeup"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Slack" "slack"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Spotify" "spotify"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "Transmission" "transmission"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  brew_install_cask "VLC" "vlc"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "Mac App Store"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Try and install an app from Mac App Store,
  # so we know, if we're correctly signed in.
  execute "mas install 747648890" \
    "Telegram"

  if [[ "$?" == 0 ]]; then
    execute "mas install 1461845568" "Gifox"
    execute "mas install 1359795390" "HomeAtmo"
    execute "mas install 1436522307" "Transmit"
    execute "mas install 425424353" "The Unarchiver"
  else
    print_in_red "You need to be signed into Mac App Store, before apps can be installed through CLI."
    printf "\n"
    print_in_white "Or install them manually through the Mac App Store GUI:"
    print_in_white "   • Gifox\n"
    print_in_white "   • HomeAtmo\n"
    print_in_white "   • Telegram\n"
    print_in_white "   • Transmit\n"
    print_in_white "   • The Unarchiver\n"
  fi;

}

main "$@"
