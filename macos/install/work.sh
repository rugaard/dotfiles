#!/bin/bash
#
# Install local developer environment.
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare SKIP_QUESTIONS=false

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  skip_questions "${@}" && SKIP_QUESTIONS=true

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_header "Work environment"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_subheader "Applications"

  brew_install_cask "Dropbox" "dropbox"
  brew_install_cask "Figma" "figma"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "Command line tools"

  brew_install "AWS CLI" "awscli"
  brew_install "AWS CDK" "aws-cdk"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "Services"

  brew_install "OpenSearch" "opensearch"
  brew_install "Typesense" "typesense/tap/typesense-server"

  print_in_purple "\n   Starting services\n\n"

  execute "brew services restart opensearch" "OpenSearch"
  execute "brew services restart typesense-server" "Typesense"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "Server"

  if [ ! -d "${HOME}/Sites/Aller" ]; then
    mkdir -p "${HOME}/Sites/Aller"
    print_result $? "Create '~/Sites/Aller' folder"
  else
    print_success "Create '~/Sites/Aller' folder"
  fi

  execute "cd ${HOME}/Sites/Aller && ${HOME}/.composer/vendor/bin/valet park" \
    "Park Valet at '~/Sites/Aller'"
}

main "$@"
