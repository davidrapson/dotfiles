#!/usr/bin/env bash

set -e

# Install command-line tools using Homebrew.
# You may also want to install brew cask for Apps.

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

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install newer version of ZSH
brew install zsh
brew install zsh-completions

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen


# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Development tools
brew install git
brew install git-extras
brew install hub
brew install awscli
brew install nginx
brew install android-sdk
# brew install heroku-toolbelt

# JavaScript
brew install node
brew install phantomjs

# Scala
# brew install sbt
# brew install scala
# brew install typesafe-activator

# Ruby
# brew install rbenv
# brew install rbenv-gem-rehash
# brew install ruby-build

# PHP & MySQL
# brew install mysql
# brew install memcached
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
brew install rename
brew install htop-osx
brew install ngrok
brew install ngrep
brew install tree
brew install grc
brew install jq

# Remove outdated versions from the cellar
brew cleanup
