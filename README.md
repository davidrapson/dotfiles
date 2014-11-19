# Dotfiles

## Requirements

- ZSH
- Homebrew
- Ruby & Rake (for setup)

## Setup

- Fork this repo
- `git clone git://github.com/YOURUSERNAME/dotfiles.git ~/.dotfiles && cd ~/.dotfiles`
- `rake`

## Common Modules

- `init/brew_setup.sh` to install essential Homebrew tools
- `init/npm_setup.sh` to intall essential global npm tools

* * *

Put (optional) git environment variables in `~/.secrets`

### `~/.secrets`

    export GIT_AUTHOR_NAME=''
    export GIT_AUTHOR_EMAIL=''
    export GIT_COMMITTER_NAME=''
    export GIT_COMMITTER_EMAIL=''
    export GITHUB_USER=''
    export GITHUB_TOKEN=''

♥
