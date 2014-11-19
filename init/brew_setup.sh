#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install ZSH
brew install zsh
brew install zsh-completions

# Install more recent versions of some OS X tools
brew tap homebrew/versions
brew tap homebrew/dupes
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install grc

# Ruby
brew install rbenv
brew install rbenv-gem-rehash
brew install ruby-build

# Version Control
brew install git
brew install git-extras
brew install git-flow
brew install legit
brew install tig
brew install mercurial

# PHP & MySQL
brew install php-version
brew install php54 --with-fpm --with-apache --with-mysql
brew install php54-memcached
brew install libmemcached
brew install php54-xdebug
brew install php54-xhprof
brew install php54-mcrypt
brew install composer
brew install behat
brew install mysql

# JS
brew install node
brew install chromedriver
brew install phantomjs
brew install webkit2png

# Install other useful binaries
brew install the_silver_searcher
brew install lynx
brew install rename
brew install tree
brew install spark
brew install trash
brew install jq

# Remove outdated versions from the cellar
brew cleanup
