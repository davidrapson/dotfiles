#######################################
# Helpers
#######################################

alias reload='source $HOME/.zshrc'

alias o='open .'

alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~' # `cd` is probably faster to type though

if [[ $+commands[fasd] ]]; then
  alias c='fasd_cd -d'
  alias j='fasd_cd -d'
fi

# Alias search to the installed command
# The silver surfer (ag) -> ack -> grep
if (( $+commands[ag] )) ; then
  alias search='ag'
elif (( $+commands[ack] )) ; then
  alias search='ack'
else
  alias search='grep'
fi

if (( $+commands[tree] )) ; then
  alias ll='tree --dirsfirst -ChFupDaLg 1'
else
  alias ll='ls -al'
fi

# -a  -- list entries starting with .
# -m  -- comma separated
alias llm='ls -am'

# mkdir + cd = take
function take() {
  mkdir $1
  cd $1
}

function follow() {
  less +F $1
}

# Recursively remove .DS_Store files
function cleanup() {
  find . -name '*.DS_Store' -type f -ls -delete
}

function fixperms() {
  find . -type d -exec chmod 0755 {} \;
  find . -type f -exec chmod 0644 {} \;
}

function escape() {
  printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
  # print a newline unless we’re piping the output to another program
  if [ -t 1 ]; then
    echo # newline
  fi
}

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
