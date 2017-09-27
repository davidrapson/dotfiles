
# Clean Setup

## Setup iTerm

- Install [Hack](https://github.com/chrissimpkins/Hack) font
- Install additional colour schemes from [iTerm colors](https://github.com/bahlo/iterm-colors)

## Install Xcode

```
xcode-select --install
Xcode > Preferences > Downloads > Command Line Tools
```

## Setup ZSH

```
brew install zsh zsh-completions
```

Add `/usr/local/bin/zsh` to `/etc/shells` then change shell `chsh -s /usr/local/bin/zsh`

## Setup Dotfiles

Sync:

```
cd ~/.dotfiles
git submodule update --init
rake
```

Run macOS setup (will need restart)

```
init/macos
```

Install tools:

```
# Install Homebrew and run:
init/brews
```

## Setup Github/SSH

```
ssh-keygen -t rsa -C "email@example.com"

# Copy ssh key to github.com
more ~/.ssh/id_rsa.pub | pbcopy

# Test connection
ssh -T git@github.com
```

## Set global environment variables for Git

See: https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables

**See also:** https://help.github.com/articles/which-remote-url-should-i-use/#cloning-with-https-recommended

