#!/bin/bash
#
# Install Xcode.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare SKIP_QUESTIONS=false

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

agree_with_xcode_license() {

  # Automatically agree to the terms of the `Xcode` license.
  # https://github.com/alrra/dotfiles/issues/10

  local XCODE_VERSION="$(xcodebuild -version | grep '^Xcode\s' | sed -E 's/^Xcode[[:space:]]+([0-9\.]+)/\1/')"
  local ACCEPTED_LICENSE_VERSION="$(defaults read /Library/Preferences/com.apple.dt.Xcode 2> /dev/null | grep IDEXcodeVersionForAgreedToGMLicense | cut -d '"' -f 2)"

  if [[ "${XCODE_VERSION}" != "${ACCEPTED_LICENSE_VERSION}" ]]; then
    sudo xcodebuild -license accept &> /dev/null
    print_result $? "Agree to the terms of the Xcode license"
  else
    print_success "Agree to the terms of the Xcode license"
  fi

}

are_xcode_command_line_tools_installed() {
  xcode-select --print-path &> /dev/null
}

install_xcode() {

  # If necessary, prompt user to install `Xcode`.

  if ! is_xcode_installed; then
    open "macappstores://itunes.apple.com/en/app/xcode/id497799835"
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Wait until `Xcode` is installed.

  execute "until is_xcode_installed; do sleep 5; done" \
    "Install Xcode.app"

}

install_xcode_command_line_tools() {

  # If necessary, prompt user to install
  # the `Xcode Command Line Tools`.

  xcode-select --install &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Wait until the `Xcode Command Line Tools` are installed.

  execute "until are_xcode_command_line_tools_installed; do sleep 5; done" \
    "Install Xcode Command Line Tools"

}

is_xcode_installed() {
  [ -d "/Applications/Xcode.app" ]
}

set_xcode_developer_directory() {

  # Point the `xcode-select` developer directory to
  # the appropriate directory from within `Xcode.app`.
  #
  # https://github.com/alrra/dotfiles/issues/13

  sudo xcode-select -switch "/Applications/Xcode.app/Contents/Developer" &> /dev/null
  print_result $? "Make 'xcode-select' developer directory point to the appropriate directory from within Xcode.app"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  skip_questions "${@}" && SKIP_QUESTIONS=true

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_header "Xcode"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  install_xcode_command_line_tools
  agree_with_xcode_license

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! ${SKIP_QUESTIONS}; then
    printf "\n"
    ask_for_confirmation "Do you want to install Xcode?"
  fi

  if ${SKIP_QUESTIONS} || answer_is_yes; then
    printf "\n"
    install_xcode
    set_xcode_developer_directory
  fi

}

main "$@"
