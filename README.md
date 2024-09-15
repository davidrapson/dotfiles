# ~/.dotfiles

My personal dotfiles, based around zsh.

## Goals

These dotfiles are designed to support the main systems I use (macOS, Fedora, and Raspberry Pi OS) and cover an absolutely minimal set up optimised for simplicity and startup speed.

## Requirements

- ZSH as your default shell
- Git for cloning the repository and some dependencies
- Homebrew (macOS), dnf (Fedora), or apt (Debian)

## Setup

Clone the repository into `~/.dotfiles`

```sh
git clone https://github.com/davidrapson/dotfiles.git ~/.dotfiles
```

Remaining commands need to be run from within the dotfiles directory:

```sh
cd ~/.dotfiles
```

Running the setup command will run the necessary install scripts based on your environment and symlink any dotfiles.

```sh
./setup
```

## Profile

These dotfiles don't include any shell integrations beyond the basic pure prompt. I often prefer to put these in `.zprofile` as the exact tools depened on the system. For example on macOS Homebrew will install the `shellenv` script here as part of the installation process. Example set up for reference:

```sh
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up fzf key bindings and fuzzy completion
# https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
source <(fzf --zsh)

# Set up https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# Set up https://github.com/rbenv/rbenv
eval "$(rbenv init - --no-rehash zsh)"

# Set up https://github.com/Schniz/fnm
eval "$(fnm env --use-on-cd --shell zsh)"
```

## Local overrides

Any files including `.local` are ignored by git. By convention a `.gitconfig.local` is referenced from the included `gitconfig`. You should use this for including private or OS-specific configuration e.g.

```
[user]
  email = example@example.com
  name = Your Name
```

Or for example, if you want to add any local zsh configuration put it in `topics/env.local.zsh`.

♥
