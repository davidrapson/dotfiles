#######################################
# Helpers
#######################################

alias c='clear'
alias o='open .'
alias h='history'
alias rtfm='man'

alias ..='cd ..'
alias ...='cd ../..'
alias ~="cd ~" # `cd` is probably faster to type though

alias reload='source ~/.zshrc'
alias ccode='cd ~/Developer/code/'

# -a  -- list entries starting with .
# -x  -- sort horizontally
alias l='ls -ax'

# -a  -- list entries starting with .
# -1  -- single column output
alias lls='ls -a1'

# -a  -- list entries starting with .
# -m  -- comma separated
alias llm='ls -am'

# -l  -- long listing
# -h  -- print sizes in human readable form
# -p  -- append file type indicators for directory
# -A  -- list all except . and ..
alias lll='ls -lhpA'

# brew install tree
if (( $+commands[tree] )) ; then
  # Tree shortcuts
  # brew install tree
  # -a All files are printed.
  #    By default tree does not print hidden files
  # -L Max display depth of the directory tree.

  # See https://github.com/gf3/dotfiles/blob/master/.aliases#L6
  # brew install tree
  alias ll='tree --dirsfirst -ChFupDaLg 1'
  alias lld='ll -d'

  # Laziness
  alias t='tree'
  # All files
  alias ta='tree -a'
  # All files limited to 2 levels deep
  alias t2='tree -aL 2'
  # All files limited to given depth
  alias tl='tree -aL'

else
  alias ll='ls -al'
  alias lld='CLICOLOR_FORCE=1 ll | grep --color=never "^d"'
fi

# Aliasing eachdir like this allows you to use aliases/functions as commands.
alias eachdir=". eachdir"

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

# mkdir + cd = take
function take() {
  mkdir $1
  cd $1
}

# cd + ls = cl
function cl() {
  cd $1
  ls
}

# Full path to a given file
function fpath() {
  find `pwd` -name $1
}

function dfind() {
  find . -name $1 -type d
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

# Compare directories
function compare-dirs() {
  diff -qr $1 $2 | grep -v -e 'DS_Store' -e 'Thumbs' | sort
}

# Open man page in Preview
function pman() {
  man -t "${1}" | open -f -a Preview
}
