# Helpers
# =======

# Aliases
# -------

alias reload='source ~/.zshrc'
alias cproj="cd ~/Sites/projects/"
alias ccode="cd ~/Developer/code/"

# Functions
# ---------

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

# Recursively remove .DS_Store files
function cleanup() {
  find . -name '*.DS_Store' -type f -ls -delete
}
