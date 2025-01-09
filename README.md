# Dotfiles

The purpose of this repository is to automate as much as possible, when setting up and maintaining a Mac machine. It takes the effort out installing and configuring everything manually.

You are more than welcome to fork the entire repository or cherry-pick anything you feel like.

## 📖 Table of contents

- [Installation](#-installation)
- [Setup](#️-setup)
- [Acknowledgements](#-acknowledgements)
- [License](#-license)

## 📦 Installation

To install the dotfiles, run the following command:

> [!CAUTION]
> Before running [the script][setup script], be absolutely sure, you know what it does.
> If you're not, then **DO NOT** run the script. Seriously, **DON'T**.

```shell
bash -c "$(curl -LsS https://raw.github.com/rugaard/dotfiles/main/setup.sh)"

# Skip all questions by saying "yes" everything
bash -c "$(curl -LsS https://raw.github.com/rugaard/dotfiles/main/setup.sh -y)"
```

That's it! ✨

## ⚙️ Setup

During installation the setup script will perform the following steps:

- Download the dotfiles
  _(by default it will suggest `~/.dotfiles`)_
- Install [Homebrew][install homebrew]
- Install [Xcode command-line tools][install xcode cli tools] and [agree to license][xcode license agreement]
- Install [Xcode][install xcode]
- Install [applications][install applications]
- Install [command-line tools][install tools]
- Install [cron jobs][install cron]
- Install [Quick Look][install quicklooks] addons
- Install developer environments, [personal][install developer] and [work][install work] _(apps, cli tools, local server and services)_
- Install and configure [ZSH][install zsh] shell with [Prezto](https://github.com/sorin-ionescu/prezto)
- Configure [`git` profile][install git]
- Set custom [icons][install icons] (system and applications)
- Set custom preferences for [system][preferences system] and [applications][preferences applications]
- Install and configure [local settings][local script] _(ID keys, licenses and configs)_
- [Initialize][git init] and [update content][git update script] from git repository
- Set [computer name](computer-name)
- [Restart machine][setup script restart]

## 🏆 Acknowledgements

- [Cătălin Mariș’ dotfiles](https://github.com/alrra/dotfiles) is the base of my entire set of dotfiles. A huge **thank you** goes out to his hard work 🙏🏻
- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) for his legendary collection of macOS default configuration settings.
- [Zach Holman](https://github.com/holman/dotfiles) and [Mislav Marohnić](https://github.com/mislav/dotfiles) for their collection of `bin` scripts.

## 📝 License

This project is available under the [MIT license][license].

<!-- Link labels: -->
[computer-name]: macos/set_computer_name
[install applications]: macos/install/applications
[install cron]: macos/install/cron
[install git]: macos/git_profile
[install developer]: macos/install/developer
[install homebrew]: macos/install/homebrew
[install icons]: macos/install/icons
[install quicklooks]: macos/install/quicklooks
[install tools]: macos/install/tools
[install work]: macos/install/work
[install xcode cli tools]: https://github.com/rugaard/dotfiles/blob/main/macos/install/xcode.sh#L53-L67
[xcode license agreement]: https://github.com/rugaard/dotfiles/blob/main/macos/install/xcode.sh#L15-L30
[install xcode]: https://github.com/rugaard/dotfiles/blob/main/macos/install/xcode.sh#L102-L111
[install zsh]: macos/install/zsh
[preferences applications]: macos/preferences/applications
[preferences system]: macos/preferences/system
[setup script]: https://github.com/alrra/dotfiles/blob/main/src/os/setup.sh
[setup script restart]: https://github.com/rugaard/dotfiles/blob/main/setup.sh#L306-L315
[local script]: local
[git init]: https://github.com/rugaard/dotfiles/blob/main/setup.sh#L266-L273
[git update script]: update
[license]: LICENSE
