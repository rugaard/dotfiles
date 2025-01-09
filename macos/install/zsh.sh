#!/bin/bash
#
# Install Prezto (ZSH) shell.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare PREZTO_REPOSITORY="https://github.com/sorin-ionescu/prezto.git"
declare SKIP_QUESTIONS=false

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  local dotfilesDirectory="$(cd ../ && pwd)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  skip_questions "${@}" && SKIP_QUESTIONS=true

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_header "Configure shell"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  local zshFilesToSymlink=(
    "zsh/zshrc"
    "zsh/zshenv"
    "zsh/zprofile"
    "zsh/zlogin"
    "zsh/zlogout"
    "zsh/zaliases"
  )

  for i in "${zshFilesToSymlink[@]}"; do
    sourceFile="${dotfilesDirectory}/${i}"
    targetFile="${HOME}/.$(printf "%s" "${i}" | sed "s/.*\/\(.*\)/\1/g")"

    if ${SKIP_QUESTIONS}; then
      symlink "${sourceFile}" "${targetFile}" -y
    else
      symlink "${sourceFile}" "${targetFile}"
    fi
  done

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if ! ${SKIP_QUESTIONS}; then
      printf "\n"
      ask_for_confirmation "Do you want to install Prezto?"
  fi

  if ${SKIP_QUESTIONS} || answer_is_yes; then

    printf "\n"

    if [[ ! -f "${dotfilesDirectory}/vendor/prezto/init.zsh" ]]; then
        execute "git clone --recursive ${PREZTO_REPOSITORY} '${dotfilesDirectory}/vendor/prezto'" \
          "Download Prezto"
    else
        print_success "Download Prezto"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "\n"

    print_subheader "Configure Prezto"

    if ${SKIP_QUESTIONS}; then
      symlink "${dotfilesDirectory}/vendor/prezto" "${HOME}/.zprezto" -y
      symlink "${dotfilesDirectory}/zsh/prezto/zpreztorc" "${HOME}/.zpreztorc" -y
      symlink "${dotfilesDirectory}/zsh/prezto/prompt_rugaard_setup" "${dotfilesDirectory}/vendor/prezto/modules/prompt/functions/prompt_rugaard_setup" -y
    else
      symlink "${dotfilesDirectory}/vendor/prezto" "${HOME}/.zprezto"
      symlink "${dotfilesDirectory}/zsh/prezto/zpreztorc" "${HOME}/.zpreztorc"
      symlink "${dotfilesDirectory}/zsh/prezto/prompt_rugaard_setup" "${dotfilesDirectory}/vendor/prezto/modules/prompt/functions/prompt_rugaard_setup"
    fi

  fi

}

main "$@"
