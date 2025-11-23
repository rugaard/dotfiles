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

  print_header "Developer environment"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_subheader "Applications"

  brew_install_cask "Docker" "docker"
  brew_install_cask "PHPStorm" "phpstorm "
  brew_install_cask "Visual Studio Code" "visual-studio-code"

  print_in_purple "\n   Extensions for Visual Studio Code\n\n"

  install_vscode_extension "Better DockerFile Syntax" "jeff-hykin.better-dockerfile-syntax"
  install_vscode_extension "Better PHPUnit" "calebporzio.better-phpunit"
  install_vscode_extension "Composer" "DEVSENSE.composer-php-vscode"
  install_vscode_extension "Docker" "ms-azuretools.vscode-docker"
  install_vscode_extension "EditorConfig" "EditorConfig.EditorConfig"
  install_vscode_extension "ESLint" "dbaeumer.vscode-eslint"
  install_vscode_extension "ESPHome" "ESPHome.esphome-vscode"
  install_vscode_extension "GitLens" "eamodio.gitlens"
  install_vscode_extension "Home Assistant Config Helper" "keesschollaart.vscode-home-assistant"
  install_vscode_extension "HTML CSS Support" "ecmel.vscode-html-css"
  install_vscode_extension "indent-rainbow" "oderwat.indent-rainbow"
  install_vscode_extension "Inertia.js" "nhedger.inertia"
  install_vscode_extension "JavaScript and TypeScript Nightly" "ms-vscode.vscode-typescript-next"
  install_vscode_extension "Laravel" "laravel.vscode-laravel"
  install_vscode_extension "Laravel Pint" "open-southeners.laravel-pint"
  install_vscode_extension "Material Theme - Free" "Equinusocio.vsc-material-theme"
  install_vscode_extension "Material Theme Icons - Free" "equinusocio.vsc-material-theme-icons"
  install_vscode_extension "NPM" "idered.npm"
  install_vscode_extension "npm Intellisense" "christian-kohler.npm-intellisense"
  install_vscode_extension "PHP DocBlocker" "neilbrayfield.php-docblocker"
  install_vscode_extension "PHP Intelephense" "bmewburn.vscode-intelephense-client"
  install_vscode_extension "PHP Namespace Resolver" "MehediDracula.php-namespace-resolver"
  install_vscode_extension "Rainbow CSV" "mechatroner.rainbow-csv"
  install_vscode_extension "SVG Previewer" "vitaliymaz.vscode-svg-previewer"
  install_vscode_extension "Tailwind CSS IntelliSense" "bradlc.vscode-tailwindcss"
  install_vscode_extension "Tailwind Fold" "stivo.tailwind-fold"
  install_vscode_extension "Tailwind Shades" "bourhaouta.tailwindshades"
  install_vscode_extension "Vue - Official" "Vue.volar"
  install_vscode_extension "YAML" "redhat.vscode-yaml"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "Command line tools"

  brew_install "Cloudflared" "cloudflared"
  brew_install "DiffSoFancy" "diff-so-fancy"
  brew_install "EditorConfig" "editorconfig"
  brew_install "Git" "git"
  brew_install "Git Flow" "git-flow"
  brew_install "GitHub CLI" "gh"
  brew_install "Imagemagick" "imagemagick"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "Services"

  brew_install "dnsmasq" "dnsmasq"
  brew_install "Mailpit" "mailpit"
  brew_install "MySQL" "mysql"
  brew_install "Nginx" "nginx"
  brew_install "Redis" "redis"

  print_in_purple "\n   Starting services\n\n"

  execute "brew services restart dnsmasq" "dnsmasq"
  execute "brew services restart mailpit" "Mailpit"
  execute "brew services restart mysql" "MySQL"
  execute "brew services restart nginx" "Nginx"
  execute "brew services restart redis" "Redis"

  # # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "Node"

  brew_install "Node version manager" "nvm"
  execute "$(source /opt/homebrew/opt/nvm/nvm.sh && nvm install node > /dev/null 2>&1)" "Install latest version"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "PHP"

  brew_tap "shivammathur/php"
  brew_tap "shivammathur/extensions"

  print_in_purple "\n   PHP 8.5\n\n"
  brew_install "PHP" "php"
  brew_install "Extension: Intl" "php-intl"
  brew_install "Extension: PHPRedis" "shivammathur/extensions/phpredis@8.5"
  brew_install "Extension: Imagick" "shivammathur/extensions/imagick@8.5"
  brew_install "Extension: PCOV" "shivammathur/extensions/pcov@8.5"

  print_in_purple "\n   PHP 8.4\n\n"
  brew_install "PHP" "shivammathur/php/php@8.4"
  brew_install "Extension: PHPRedis" "shivammathur/extensions/phpredis@8.4"
  brew_install "Extension: Imagick" "shivammathur/extensions/imagick@8.4"
  brew_install "Extension: PCOV" "shivammathur/extensions/pcov@8.4"

  print_in_purple "\n   PHP 8.3\n\n"
  brew_install "PHP" "shivammathur/php/php@8.3"
  brew_install "Extension: PHPRedis" "shivammathur/extensions/phpredis@8.3"
  brew_install "Extension: Imagick" "shivammathur/extensions/imagick@8.3"
  brew_install "Extension: PCOV" "shivammathur/extensions/pcov@8.3"

  print_in_purple "\n   Applications\n\n"
  brew_install_cask "PHP Monitor" "phpmon" "--" "nicoverbruggen/cask"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "Package managers"

  if cmd_exists "composer"; then
    print_success "Composer"
  else
    brew_install "Composer" "composer"
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "Frameworks"

  if cmd_exists "laravel"; then
    execute "composer global update laravel/installer" "Laravel"
  else
    execute "composer global require laravel/installer" "Laravel"
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  printf "\n"

  print_subheader "Server"

  execute "composer global require laravel/valet" "Valet"
  execute "${HOME}/.composer/vendor/bin/valet install" "Configure Valet"

  if [ ! -d "${HOME}/Sites" ]; then
    mkdir -p "${HOME}/Sites"
    print_result $? "Create '~/Sites' folder"
  else
    print_success "Create '~/Sites' folder"
  fi

  execute "cd ${HOME}/Sites && ${HOME}/.composer/vendor/bin/valet park" \
    "Park Valet at '~/Sites'"

  if [ ! -d "${HOME}/Sites/Private" ]; then
    mkdir -p "${HOME}/Sites/Private"
    print_result $? "Create '~/Sites/Private' folder"
  else
    print_success "Create '~/Sites/Private' folder"
  fi

  execute "cd ${HOME}/Sites/Private && ${HOME}/.composer/vendor/bin/valet park" \
    "Park Valet at '~/Sites/Private'"
}

main "$@"
