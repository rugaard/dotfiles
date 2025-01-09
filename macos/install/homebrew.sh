#!/bin/bash
#
# Install Homebrew.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install() {

  if ! cmd_exists "brew"; then
    ask_for_sudo
    printf "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &> /dev/null
    #  └─ simulate the ENTER keypress
  fi

  print_result $? "Install"

}

get_git_config_file_path() {

  local path=""

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if path="$(brew --repository 2> /dev/null)/.git/config"; then
    printf "%s" "$path"
    return 0
  else
    print_error "Get config file path"
    return 1
  fi

}

opt_out_of_analytics() {

  local path=""

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Try to get the path of the `Homebrew` git config file.

  path="$(get_git_config_file_path)" || return 1

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Turn off analytics
  brew analytics off

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_result $? "Homebrew (opt-out of analytics)"

}

main() {

  print_header "Homebrew"

  install
  opt_out_of_analytics

  brew_update
  brew_upgrade
}

main "$@"
