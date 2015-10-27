# ~/.dotfiles

## Requirements

- ZSH
- Homebrew
- Rake (for setup)

## Setup

- `git clone git://github.com/davidrapson/dotfiles.git ~/.dotfiles && cd ~/.dotfiles`
- `git submodule update --init`
- `rake`

See [init/README.md](init/README.md) for detailed instructions.

* * *

### `topics/private/*.zsh`

Any directories named `private` are ignored from version control. If you want to add any private functions or aliases put them in `topics/private/`. As a convention I also put any private shell scripts in `scripts/private`.

♥
