#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install ZSH
brew install zsh
brew install zsh-completions

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew tap homebrew/versions
brew tap homebrew/dupes
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Version Control
brew install git
brew install git-extras

# JavaScript
brew install node

# Ruby
# brew install rbenv
# brew install rbenv-gem-rehash
# brew install ruby-build

# Scala
# brew install sbt
# brew install scala
# brew install typesafe-activator

# PHP & MySQL
# brew install mysql
# brew install libmemcached
# brew install php-version
# brew install homebrew/php/php56 --with-gmp --with-fpm --with-apache --with-mysql
# brew install homebrew/php/php56-xdebug
# brew install homebrew/php/php56-xhprof
# brew install homebrew/php/php56-mcrypt
# brew install homebrew/php/php56-memcached
# brew install composer

# Install other useful binaries
brew install imagemagick --with-webp
brew install the_silver_searcher
brew install ngrok
brew install tree
brew install jq

# Remove outdated versions from the cellar
brew cleanup
