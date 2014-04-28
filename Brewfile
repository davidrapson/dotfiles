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
tap homebrew/versions
tap homebrew/dupes
install vim --override-system-vi
install homebrew/dupes/grep
install grc

# Ruby
install rbenv
install rbenv-gem-rehash
install ruby-build

# Version Control
install git
install git-extras
install git-flow
install legit
install tig
install mercurial

# PHP & MySQL
install php-version
install php54 --with-fpm --with-apache --with-mysql
install php54-memcached
install libmemcached
install php54-xdebug
install php54-xhprof
install php54-mcrypt
install composer
install behat
install mysql

# JS
install node
install chromedriver
install phantomjs
install webkit2png

# Install other useful binaries
install the_silver_searcher
install lynx
install rename
install tree
install spark
install trash

# Remove outdated versions from the cellar
cleanup
