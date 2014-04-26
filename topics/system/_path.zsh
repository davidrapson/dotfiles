# Homebrew & rbenv enhanced path
PATH="$HOME/Developer/bin:$HOME/Developer/sbin:$HOME/Developer/share/npm/bin:$HOME/.rbenv/bin:$PATH"; export PATH

# Add coreutiles to path
PATH="$HOME/Developer/opt/coreutils/libexec/gnubin:$PATH"; export PATH

# Add dotfile binaries into the path
PATH="$HOME/.dotfiles/bin:$PATH"; export PATH

# For node, so modules are picked up
NODE_PATH="$HOME/Developer/lib/node_modules"; export NODE_PATH
export PHANTOMJS_BIN=$HOME/Developer/bin/phantomjs

# Custom man pages path
MANPATH="$HOME/Developer/share/man:$MANPATH"; export MANPATH
