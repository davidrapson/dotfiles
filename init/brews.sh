#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# ===============================================
# Utilities
# ===============================================

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils
if [ ! -L /usr/local/bin/gsha256sum ]; then
  sudo ln -sf /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
fi
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# GRC colorizes unix tools
brew install grc

# Install newer version of ZSH
brew install zsh
brew install zsh-completions

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install wget --with-iri

# Manage services with `brew services`
# Small wrapper around launchctl
brew tap homebrew/services

# Search tools
brew install the_silver_searcher
brew install ack

# Version control (Git)
brew install git
brew install git-extras
brew install diff-so-fancy
brew install bfg

# Development environment
brew install nginx
brew install dnsmasq
brew install awscli
brew install heroku
brew install android-sdk

# Network tools
brew install ngrok
brew install ngrep
brew install httpie
brew install httrack

# Imaging tools
brew install imagemagick --with-webp --with-fontconfig
brew install ffmpeg --with-libass --with-fontconfig
brew install giflossy

# Miscellaneous useful binaries
brew install htop-osx
brew install rename
brew install tmux
brew install tree
brew install fasd
brew install entr
brew install fzf
brew install jq

# ===============================================
# Languages
# ===============================================

# JavaScript
# https://github.com/creationix/nvm
brew install node6-lts
# npm install -g np david greenkeeper svgo uglify-js
# npm install -g jspm-check-updates webpack-bundle-size-analyzer source-map-explorer
# npm install -g alfred-emoj alfred-npms

# PHP, Memcached, MariaDB
# Remember to follow steps in brew info for each and run
# mysql_secure_installation for MariaDB
# brew install homebrew/php/php56 --with-gmp --with-fpm --with-apache --with-mysql
# brew install homebrew/php/php56-xdebug
# brew install homebrew/php/php56-xhprof
# brew install homebrew/php/php56-mcrypt
# brew install homebrew/php/php56-tidy
# brew install memcached libmemcached
# brew install homebrew/php/php56-memcached
# brew install composer
# brew install boris
# brew install mariadb

# Scala
# brew install sbt
# brew install scala
# brew install typesafe-activator

# Python
# brew install python
# brew install python3
# brew install bpython
# pip install --upgrade pip setuptools wheel virtualenv

# Ruby
# brew install ruby
# If doing more than casual ruby:
# brew install rbenv
# brew install rbenv-gem-rehash
# brew install ruby-build


# Remove outdated versions from the cellar
brew cleanup
