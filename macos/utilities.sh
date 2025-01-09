#!/bin/bash
#
# Install utilities.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_cleanup() {

  # By default Homebrew does not uninstall older versions
  # of formulas so, in order to remove them, `brew cleanup`
  # needs to be used.
  #
  # https://github.com/Homebrew/brew/blob/496fff643f352b0943095e2b96dbc5e0f565db61/share/doc/homebrew/FAQ.md#how-do-i-uninstall-old-versions-of-a-formula

  execute "brew cleanup" "Homebrew (cleanup)"

}

brew_install_cask() {
  brew_install "$1" "$2" "--cask $3" "$4"
}

brew_install() {

  declare -r ARGUMENTS="$3"
  declare -r FORMULA="$2"
  declare -r FORMULA_READABLE_NAME="$1"
  declare -r TAP_VALUE="$4"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Check if `Homebrew` is installed.

  if ! cmd_exists "brew"; then
    print_error "${FORMULA_READABLE_NAME} ('Homebrew' is not installed)"
    return 1
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # If `brew tap` needs to be executed,
  # check if it executed correctly.

  if [ -n "${TAP_VALUE}" ]; then
    if ! brew_tap "${TAP_VALUE}"; then
      print_error "${FORMULA_READABLE_NAME} ('brew tap ${TAP_VALUE}' failed)"
      return 1
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Install the specified formula.

  if brew list "${FORMULA}" &> /dev/null; then
    print_success "${FORMULA_READABLE_NAME}"
  else
    execute "brew install ${ARGUMENTS} ${FORMULA}" "${FORMULA_READABLE_NAME}"
  fi

}

brew_prefix() {

  local path=""

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  path="$(brew --prefix 2> /dev/null)"

  if [ $? -eq 0 ]; then
    printf "%s" "${path}"
    return 0
  else
    print_error "Homebrew (get prefix)"
    return 1
  fi

}

brew_tap() {

  brew tap "$1" &> /dev/null

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_update() {

  execute "brew update" \
    "Homebrew (update)"

}

brew_upgrade() {

  execute "brew upgrade" \
    "Homebrew (upgrade)"

}

install_php_extension() {

    declare -r EXTENSION_NAME="${2}"
    declare -r EXTENSION_READABLE_NAME="${1}"

    if [[ $(pecl list | grep ${EXTENSION_NAME}) ]] || [[ $(php -m | grep ${EXTENSION_NAME}) ]]; then
      print_success "${EXTENSION_READABLE_NAME}"
    else
      execute "echo '' | pecl install --force ${EXTENSION_NAME}" \
        "${EXTENSION_READABLE_NAME}"
    fi

}

install_vscode_extension() {

    declare -r EXTENSION_NAME="${2}"
    declare -r EXTENSION_READABLE_NAME="${1}"

    execute "echo '' | /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension ${EXTENSION_NAME}" \
      "${EXTENSION_READABLE_NAME}"
}

nvm_install_version() {
  source $(brew --prefix nvm)/nvm.sh
  execute "nvm install $1" "$2"
}
