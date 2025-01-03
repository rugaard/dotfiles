#!/bin/bash
#
# Set computer name
#

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utilities.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_header "Computer name"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    while [ -z "${hostname}" ]; do
        ask 'Please choose a name for this computer: '
        hostname="$(get_answer)"
    done

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    execute "sudo scutil --set ComputerName '${hostname}' && \
            sudo scutil --set HostName '${hostname}' && \
            sudo scutil --set LocalHostName '${hostname}' && \
            sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string '${hostname}'" \
        "Computer name set to '${hostname}'"

}

main
