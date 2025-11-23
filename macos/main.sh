#!/bin/bash
#
# Setup and configure macOS.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare SKIP_QUESTIONS=false

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  skip_questions "${@}" && SKIP_QUESTIONS=true

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if the terminal has "Full Disk Access", and if it does
    # not, ask the user to grant it.
    #
    # This is required in order to be able to set some preferences.
    # See also: https://lapcatsoftware.com/articles/containers.html.
    if ! ls "$HOME/Library/Containers/com.apple.Safari/Data" &> /dev/null; then
      printf "\n"

      # Open the "Full Disk Access" system preferences.
      open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"

      # Ask the user to grant "Full Disk Access".
      ask "Please grant the terminal \"Full Disk Access\" and then press any key to continue. "
    fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Homebrew.

  ./install/homebrew.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  # Xcode.

  ./install/xcode.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  # Applications.

  if ${SKIP_QUESTIONS}; then
    ./install/applications.sh -y
  else
    printf "\n"
    ask_for_confirmation "Do you want to install applications?"

    if answer_is_yes; then
      ./install/applications.sh
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  # Command Line Tools.

  if ${SKIP_QUESTIONS}; then
    ./install/tools.sh -y
  else
    printf "\n"
    ask_for_confirmation "Do you want to install command line tools?"

    if answer_is_yes; then
      ./install/tools.sh
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  # Cron jobs.

  if ${SKIP_QUESTIONS}; then
    ./install/cron.sh -y
  else
    printf "\n"
    ask_for_confirmation "Do you want to install cron jobs?"

    if answer_is_yes; then
      ./install/cron.sh
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  # Quick Look addons.

  if ${SKIP_QUESTIONS}; then
    ./install/quicklooks.sh -y
  else
    printf "\n"
    ask_for_confirmation "Do you want to install 'Quick Look' addons?"

    if answer_is_yes; then
      ./install/quicklooks.sh
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  # Developer environment.

  if ${SKIP_QUESTIONS}; then
    ./install/developer.sh -y
  else
    printf "\n"
    ask_for_confirmation "Do you want to install developer environment?"

    if answer_is_yes; then
      ./install/developer.sh
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  # Work environment.

  if ${SKIP_QUESTIONS}; then
    ./install/work.sh -y
  else
    printf "\n"
    ask_for_confirmation "Do you want to install work environment?"

    if answer_is_yes; then
      ./install/work.sh
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  # Configure shell.

  if ${SKIP_QUESTIONS}; then
    ./install/zsh.sh -y
  else
    printf "\n"
    ask_for_confirmation "Do you want to configure the shell?"

    if answer_is_yes; then
      ./install/zsh.sh
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  # Configure git profile.

  if ${SKIP_QUESTIONS}; then
    ./git_profile.sh -y
  else
    printf "\n"
    ask_for_confirmation "Do you want to configure your Git profile?"

    if answer_is_yes; then
      ./git_profile.sh
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_white "\n   ---\n"

  # Configure custom macOS preferences.

  if ! ${SKIP_QUESTIONS}; then
    printf "\n"
    ask_for_confirmation "Do you want to set custom preferences?"
  fi

  if ${SKIP_QUESTIONS} || answer_is_yes; then

    # Close any open `System Preferences` panes in order to
    # avoid overriding the preferences that are being changed.

    osascript -e 'tell application "System Preferences" to quit' &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./preferences/system.sh
    printf "\n"
    ./preferences/applications.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Starting with Mac OS X Mavericks preferences are cached,
    # so in order for things to get properly set using `PlistBuddy`,
    # the `cfprefsd` process also needs to be killed.
    #
    # https://github.com/alrra/dotfiles/commit/035dda057ddc6013ba21db3d2c30eeb51ba8f200

    killall "cfprefsd" &> /dev/null
    killall "corebrightnessd" &> /dev/null
  fi

}

main "$@"
