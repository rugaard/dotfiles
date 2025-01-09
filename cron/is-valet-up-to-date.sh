#!/bin/bash
#
# Morten Rugaard <morten@rugaard.me>
#

declare VALET_PATH=$(which valet)

if [[ "$(${VALET_PATH} on-latest-version)" == 'NO' ]]; then

    if command -v "terminal-notifier" &> /dev/null; then
        terminal-notifier -title "Ny version tilgængelig!" \
                          -subtitle "Laravel Valet" \
                          -message "Tryk her for at installere seneste version." \
                          -groupId "cronLaravelValet" \
                          -execute "composer global update laravel/valet"
    else
        osascript -e 'display notification "Ny version tilgængelig!" with title "Laravel Valet"'
    fi

    say "Ny version af Valet er tilgængelig."

fi
