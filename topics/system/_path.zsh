# Make sure /usr/local (Homebrew) comes first
PATH="/usr/local/bin:/usr/local/sbin:$PATH"; export PATH

# NPM & rbenv enhanced PATH
PATH="/usr/local/share/npm/bin:$HOME/.rbenv/bin:$PATH"; export PATH

# Add coreutiles to PATH
PATH="/usr/local//opt/coreutils/libexec/gnubin:$PATH"; export PATH

# Add dotfile binaries to PATH
PATH="$HOME/.dotfiles/bin:$PATH"; export PATH

# For node, so modules are picked up
NODE_PATH="/usr/local/lib/node_modules"; export NODE_PATH

# Add custom man pages to PATH
MANPATH="/usr/local/share/man:$MANPATH"; export MANPATH

# Set RBENV_ROOT
RBENV_ROOT="/usr/local/var/rbenv"; export RBENV_ROOT
