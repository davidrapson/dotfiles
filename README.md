# Dotfiles

## Setup

1. `git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh`
2. `rm -rf ~/.oh-my-zsh/custom`
3. `git clone git@github.com:davidrapson/dotfiles.git ~/.dotfiles`
4. `cd ~/.dotfiles`
5. `rake`
6. Put git environment variables in `~/.secrets`

* * *

### `~/.secrets`

    export GIT_AUTHOR_NAME=''
    export GIT_AUTHOR_EMAIL=''
    export GIT_COMMITTER_NAME=''
    export GIT_COMMITTER_EMAIL=''
    export GITHUB_USER=''
    export GITHUB_TOKEN=''