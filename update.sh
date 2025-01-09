#!/bin/bash
#
# Initialize and update Git repository
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_header "Update dotfiles"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ssh -T git@github.com &> /dev/null

    if [ $? -ne 1 ]; then
        print_error "No SSH key with access to GitHub was available."
        exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    git fetch --all 1> /dev/null \
        && git reset --hard origin/main 1> /dev/null \
        && git clean -fd 1> /dev/null

    print_result $? "Update content"

}

main
