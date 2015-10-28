# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# AWS completions
if (( $+commands[aws] )); then
  source $BREW_PREFIX/share/zsh/site-functions/_aws
fi
