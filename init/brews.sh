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
brew install git-fixup
brew install bfg

# Development environment
brew install nginx
brew install awscli
brew install autoenv
brew install dnsmasq
brew install android-sdk

# Network tools
brew install nghttp2
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
brew install httpie
brew install tmux
brew install tree
brew install fasd
brew install entr
brew install fzf
brew install jq

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Remove outdated versions from the cellar
brew cleanup
