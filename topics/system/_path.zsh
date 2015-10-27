# Make sure /usr/local (Homebrew) comes first
PATH=/usr/local/bin:/usr/local/sbin:$PATH; export PATH

# NPM & rbenv enhanced PATH
PATH=$(brew --prefix)/share/npm/bin:$HOME/.rbenv/bin:$PATH; export PATH

# Add coreutiles to PATH
PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH; export PATH

# Add dotfile binaries to PATH
PATH="$HOME/.dotfiles/bin:$PATH"; export PATH

# For node, so modules are picked up
NODE_PATH="$(brew --prefix)/lib/node_modules"; export NODE_PATH

# Add custom man pages to PATH
MANPATH="$(brew --prefix)/share/man:$MANPATH"; export MANPATH

# Set RBENV_ROOT
RBENV_ROOT="$(brew --prefix)/var/rbenv"; export RBENV_ROOT
