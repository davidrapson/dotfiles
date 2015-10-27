
# Clean Setup

## Apps

Xcode, Iterm 2, Sublime Text 3, Sequel Pro, Chrome

## Setup iTerm

- Install [Hack](https://github.com/chrissimpkins/Hack) font
- Install Solarized Dark Higher Contrast [iTerm colour schemes](https://github.com/bahlo/iterm-colors) 

## Xcode Command Line Tools

```
xcode-select --install
Xcode > Preferences > Downloads > Command Line Tools
```

## Set Hostname

```
sudo scutil --set HostName blah
```

## Homebrew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions
```

**To fix El Capitan**: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/El_Capitan_and_Homebrew.md

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

Run OSX setup (will need restart)

```
init/osx.zh
```

Install tools:

```
# Install essential Homebrew tools
# It's worth running brew info on each brew and following any extra steps
init/brews.sh
# Install programming language specific tools
init/languages.sh
```

## Setup Github/SSH

```
ssh-keygen -t rsa -C "email@example.com"

# Copy ssh key to github.com
more ~/.ssh/id_rsa.pub | pbcopy

# Test connection
ssh -T git@github.com

# Set git config values
git config --global user.name "Your Name"
git config --global user.email "email@example.com"
git config --global github.user yourusername
git config --global github.token your_token_here
```

**See also:** https://help.github.com/articles/which-remote-url-should-i-use/#cloning-with-https-recommended

## Sublime Install Checklist

- Install binary
- Install Package Control
- Sync user preferences


## Setup Dnsmasq

Based on: http://passingcuriosity.com/2013/dnsmasq-dev-osx/

```
brew install dnsmasq
# Copy the default configuration file.
cp $(brew list dnsmasq | grep /dnsmasq.conf.example$) /usr/local/etc/dnsmasq.conf
# Copy the daemon configuration file into place.
sudo cp $(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/
# Start Dnsmasq automatically.
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
# Add to /usr/local/etc/dnsmasq.conf
address=/site/127.0.0.1
# Restart
sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq
# Add custom resolver
sudo mkdir -p /etc/resolver
sudo tee /etc/resolver/site >/dev/null <<EOF
nameserver 127.0.0.1
EOF
# Make sure you haven't broken your DNS.
ping -c 1 www.google.com
# Check that .site names work
ping -c 1 iam.the.walrus.site
```

## Brew services

Use `brew tap homebrew/services` then `brew services list` to manage services.
