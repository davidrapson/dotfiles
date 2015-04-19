# ~/.dotfiles

## Requirements

- ZSH
- Homebrew (optionaly, probably)
- Rake (for setup)

## Setup

- Fork this repo
- `git clone git://github.com/YOURUSERNAME/dotfiles.git ~/.dotfiles && cd ~/.dotfiles`
- `rake`

## Common Modules

- `init/brew_setup.sh` to install essential Homebrew tools
- `init/npm_setup.sh` to intall essential global npm tools

* * *

### `topics/private/*.zsh`

Any directories named `private` are ignored from version control. If you want to add any private functions or aliases put them in `topics/private/`. As a convention I also put any private shell scripts in `scripts/private`.

♥
