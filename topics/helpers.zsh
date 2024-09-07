#######################################
# Helpers
#######################################

# Allow quick reloading of the zshrc
alias reload='source $HOME/.zshrc'

alias o='open .'

alias ..='cd ..'
alias ...='cd ../..'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then
  colorflag="--color"
else
  colorflag="-G"
fi

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

alias l='ls -1ah ${colorflag}'
alias ll='ls -alh ${colorflag}'

# mkdir + cd = take
function take() {
  mkdir $1
  cd $1
}

function follow() {
  less +F $1
}

# Pretty print $PROFILE
function pprofile() {
  echo -e ${PATH//:/\\n}
}
