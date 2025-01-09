#!/bin/bash
#
# Configure Git profile
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare -r GIT_CONFIG_LOCAL="${HOME}/.gitconfig.local"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

generate_gitconfig_local() {

  # Ask for name

  while [ -z "${name}" ]; do
      ask "Please enter the name, you wish to sign your commits as: "
      name="$(get_answer)"
  done

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Ask for e-mail

  while [ -z "${email}" ]; do
      ask "Please enter the e-mail, you wish to sign your commits with: "
      email="$(get_answer)"
  done

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "%s" \
"[user]
    name = \"${name}\"
    email = \"${email}\"
  # signingkey =
" >> ${GIT_CONFIG_LOCAL}

  print_result ${?} "Git config (local)"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_header "Configure Git profile"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  local dotfilesDirectory="$(cd .. && pwd)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Symlink general Git files

  symlink "${dotfilesDirectory}/git/gitconfig" "${HOME}/.gitconfig" "Git config"
  symlink "${dotfilesDirectory}/git/gitignore" "${HOME}/.gitignore" "Git ignore"
  symlink "${dotfilesDirectory}/git/gitattributes" "${HOME}/.gitattributes" "Git attributes"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"
  print_subheader "Credentials"

  if [[ -f "${GIT_CONFIG_LOCAL}" ]]; then

    ask_for_confirmation "File '${GIT_CONFIG_LOCAL}' already exists. Do you want to overwrite it?"

    if answer_is_yes; then

      rm ${GIT_CONFIG_LOCAL}
      printf "\n"
      generate_gitconfig_local

    else

      print_success "Git config (local)"

    fi

  else

    generate_gitconfig_local

  fi

}

main "$@"
