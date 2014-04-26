# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install findutils
# Install ZSH
install zsh
install zsh-completions

# Install more recent versions of some OS X tools
tap homebrew/dupes
install vim --override-system-vi
install homebrew/dupes/grep

# Version Control
install git
install git-extras
install git-flow
install legit
install tig
install mercurial

# PHP & MySQL
tap josegonzalez/homebrew-php
install php53
install php53-xdebug
install php53-xhprof
install php53-mcrypt
install composer
install mysql

# Ruby
install rbenv
install ruby-build

# JS
install node
install chromedriver
install phantomjs
install webkit2png

# Install other useful binaries
install ack
install lynx
install rename
install tree
install spark
install trash

# Remove outdated versions from the cellar
cleanup
