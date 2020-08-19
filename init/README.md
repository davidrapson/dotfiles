# Clean Setup

## Setup iTerm

- Install [Fira Code](https://github.com/tonsky/FiraCode) font
- Install additional colour schemes from [iTerm colors](https://github.com/bahlo/iterm-colors)

## Install Xcode

```
xcode-select --install
Xcode > Preferences > Downloads > Command Line Tools
```

### Install homebrew and common brews

```
init/brews
```

## Setup ZSH

Add `/usr/local/bin/zsh` to `/etc/shells` then change shell `chsh -s /usr/local/bin/zsh`

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
