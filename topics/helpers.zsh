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

# Pretty print $PROFILE
function pprofile() {
  echo -e ${PATH//:/\\n}
}

function portcheck() {
   sudo lsof -i :${1:-80}
}

function ips() {
  # Show all interface IPs
  ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'
  # Show public ip
  dig +short myip.opendns.com @resolver1.opendns.com
}

# All the dig info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

# Flush Directory Service cache
function flush() {
  sudo killall -HUP mDNSResponder
}
