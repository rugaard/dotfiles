#!/bin/bash
#
# Setup dotfiles.
#

declare -r GITHUB_REPOSITORY="rugaard/dotfiles"

declare -r DOTFILES_ORIGIN="git@github.com:${GITHUB_REPOSITORY}.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/${GITHUB_REPOSITORY}/tarball/main"
declare -r DOTFILES_UTILITIES_URL="https://raw.githubusercontent.com/${GITHUB_REPOSITORY}/main/utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare DOTFILES_DIRECTORY="${HOME}/.dotfiles"
declare SKIP_QUESTIONS=false

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare HAS_FULL_DISK_ACCESS=false
declare SIP_DISABLED=false

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# ----------------------------------------------------------------------
# | Helper Functions                                                   |
# ----------------------------------------------------------------------

download() {

  local url="$1"
  local output="$2"

  if command -v "curl" &> /dev/null; then
    curl --location --silent --show-error --output "${output}" "${url}" &> /dev/null
    return $?
  elif command -v "wget" &> /dev/null; then
    wget --quiet --output-document="$output" "$url" &> /dev/null
    return $?
  fi

  return 1

}

download_dotfiles() {

  local tmpFile=""

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_header "Download and extract archive"

  tmpFile="$(mktemp /tmp/XXXXX)"

  download "${DOTFILES_TARBALL_URL}" "${tmpFile}"
  print_result $? "Download archive" "true"
  printf "\n"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! $SKIP_QUESTIONS; then

    ask_for_confirmation "Do you want to store the dotfiles in '${DOTFILES_DIRECTORY}'?"

    if ! answer_is_yes; then
      DOTFILES_DIRECTORY=""
      while [ -z "${DOTFILES_DIRECTORY}" ]; do
        ask "Please specify another location for the dotfiles (path): "
        DOTFILES_DIRECTORY="$(get_answer)"
      done
    fi

    # Ensure the `dotfiles` directory is available

    while [ -e "${DOTFILES_DIRECTORY}" ]; do
      ask_for_confirmation "'${DOTFILES_DIRECTORY}' already exists, do you want to overwrite it?"
      if answer_is_yes; then
        rm -rf "${DOTFILES_DIRECTORY}"
        break
      else
        DOTFILES_DIRECTORY=""
        while [ -z "${DOTFILES_DIRECTORY}" ]; do
          ask "Please specify another location for the dotfiles (path): "
          DOTFILES_DIRECTORY="$(get_answer)"
        done
      fi
    done

    printf "\n"

  else

    rm -rf "${DOTFILES_DIRECTORY}" &> /dev/null

  fi

  mkdir -p "${DOTFILES_DIRECTORY}"
  print_result $? "Create '${DOTFILES_DIRECTORY}'" "true"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Extract archive in the `dotfiles` directory.

  extract "${tmpFile}" "${DOTFILES_DIRECTORY}"
  print_result $? "Extract archive" "true"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  rm -rf "${tmpFile}"
  print_result $? "Remove archive"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  cd "${DOTFILES_DIRECTORY}" || return 1

}

download_utilities() {

  local tmpFile=""

  tmpFile="$(mktemp /tmp/XXXXX)"

  download "${DOTFILES_UTILITIES_URL}" "${tmpFile}" \
    && . "${tmpFile}" \
    && rm -rf "${tmpFile}" \
    && return 0

  return 1

}

extract() {

  local archive="${1}"
  local outputDir="${2}"

  if command -v "tar" &> /dev/null; then
    tar --extract --gzip --file "${archive}" --strip-components 1 --directory "${outputDir}"
    return ${?}
  fi

  return 1

}

verify_os() {

  declare -r MINIMUM_MACOS_VERSION="15.0"

  local osName="$(get_os)"
  local osVersion="$(get_os_version)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Check if the OS is `macOS` and
  # it's above the required version.

  if [ "${osName}" == "macos" ]; then
    if is_supported_version "${osVersion}" "${MINIMUM_MACOS_VERSION}"; then
      return 0
    else
      printf "Sorry, this script is intended only for macOS %s+" "${MINIMUM_MACOS_VERSION}"
    fi
  else
    printf "Sorry, this script is intended only for macOS and Ubuntu!"
  fi

  return 1

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

  # Ensure that the following actions
  # are made relative to this file's path.

  cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Load utilities

  if [ -x "./utilities.sh" ]; then
    \. ./utilities.sh || exit 1
  else
    download_utilities || exit 1
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Ensure the OS is supported and
  # it's above the required version.

  verify_os || exit 1

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Check the state full disk access and SIP.

  has_full_disk_access && HAS_FULL_DISK_ACCESS=true
  is_sip_disabled && SIP_DISABLED=true

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  skip_questions "${@}" && SKIP_QUESTIONS=true

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ask_for_sudo

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Check if this script was run directly (./<path>/setup.sh),
  # and if not, it most likely means that the dotfiles were not
  # yet set up, and they will need to be downloaded.

  printf "%s" "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null \
    || download_dotfiles

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! ${HAS_FULL_DISK_ACCESS}; then
    printf "\n"
    print_warning "Full disk access is required!\n"
    print_in_white "   This application does not have full disk access.\n\n"
    print_in_white "   Without full disk access, this setup script will not be able\n"
    print_in_white "   to complete most of it's setting changes and installation tasks.\n\n"
    print_in_white "   Go to "
    print_in_teal "System Preferences > Security & Privacy"
    print_in_white " and add this terminal app\n"
    print_in_white "   to the "
    print_in_green "Full Disk Access"
    print_in_white ", restart the app and re-run this script.\n\n"
    print_in_white "   Alternatively you can disable System Integration Protection (SIP):\n"
    print_in_purple "  https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection\n"
    exit 1;
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Configure macOS.

  if ${SKIP_QUESTIONS}; then
    ./macos/main.sh -y
  else
    ./macos/main.sh
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Configure local settings.

  ./local.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if cmd_exists "git"; then

      print_in_white "\n   ---\n"

      if [ "$(git config --get remote.origin.url)" != "${DOTFILES_ORIGIN}" ]; then

          print_header "Initialize Git repository"

          execute "git init && git remote add origin ${DOTFILES_ORIGIN}" \
            "Initialize the Git repository"

      fi

      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

      printf "\n"

      if ! ${SKIP_QUESTIONS}; then
          ask_for_confirmation "Do you want to update to latest version from the 'dotfiles' repository?"
      fi

      if ${SKIP_QUESTIONS} || answer_is_yes; then
          ./update.sh
      fi

  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  # Set computer name.

  if ${SKIP_QUESTIONS}; then
    ./macos/install/set_computer_name.sh -y
  else
    printf "\n"
    ask_for_confirmation "Do you wish to set the computer name?"

    if answer_is_yes; then
      ./macos/install/set_computer_name.sh
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  print_header "Housekeeping"

  # By default Homebrew does not uninstall older versions
  # of formulas so, in order to remove them, `brew cleanup`
  # needs to be used.
  #
  # https://github.com/Homebrew/brew/blob/496fff643f352b0943095e2b96dbc5e0f565db61/share/doc/homebrew/FAQ.md#how-do-i-uninstall-old-versions-of-a-formula
  execute "brew cleanup" "Homebrew (cleanup)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  if ! $SKIP_QUESTIONS; then
    print_header "Restart"

    ask_for_confirmation "Do you want to restart?"
    printf "\n"

    if answer_is_yes; then
      sudo shutdown -r now &> /dev/null
    fi
  fi
}

main "$@"
