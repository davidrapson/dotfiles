# Homebrew & rbenv enhanced PATH
PATH="$HOME/Developer/bin:$HOME/Developer/sbin:$HOME/Developer/share/npm/bin:$HOME/.rbenv/bin:$PATH"; export PATH

# Add coreutiles to PATH
PATH="$HOME/Developer/opt/coreutils/libexec/gnubin:$PATH"; export PATH

# Add dotfile binaries to PATH
PATH="$HOME/.dotfiles/bin:$PATH"; export PATH

# For node, so modules are picked up
NODE_PATH="$HOME/Developer/lib/node_modules"; export NODE_PATH

# Add custom man pages to PATH
MANPATH="$HOME/Developer/share/man:$MANPATH"; export MANPATH
