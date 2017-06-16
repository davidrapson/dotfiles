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

You should use a private file to set `GIT_AUTHOR_NAME` and `GIT_AUTHOR_EMAIL` as the global `.gitconfig` is under version control. For example in `topics/private/env.zsh`:

```
export GIT_AUTHOR_NAME="Ann Example"
export GIT_AUTHOR_EMAIL=example@example.com
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
```

♥
