#!/usr/bin/env bash

set -e

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew
brew update

# ===============================================
# Languages
# ===============================================

# JavaScript
brew install node
npm install -g snips-cli
npm install -g babel
npm install -g gulp
npm install -g grunt-cli
npm install -g jspm
npm install -g bower
npm install -g david
npm install -g xo

# PHP, Memcached, MariaDB
# Remember to follow steps in brew info for each and run
# mysql_secure_installation for MariaDB
brew install homebrew/php/php56 --with-gmp --with-fpm --with-apache --with-mysql
brew install homebrew/php/php56-xdebug
brew install homebrew/php/php56-xhprof
brew install homebrew/php/php56-mcrypt
brew install homebrew/php/php56-tidy
brew install memcached libmemcached
brew install homebrew/php/php56-memcached
brew install composer
brew install boris
brew install mariadb

# Scala
brew install sbt
brew install scala
brew install typesafe-activator

# Python
brew install python
brew install python3
pip install --upgrade pip setuptools wheel virtualenv

# Ruby
brew install rbenv
brew install rbenv-gem-rehash
brew install ruby-build

# Misc. Languages
brew install python
brew install go

# Remove outdated versions from the cellar
brew cleanup
