# Helpers
# =======

# Aliases
# -------

alias edit="subl -n"

alias reload='source ~/.zshrc'
alias cs='cd ~/Sites'
alias ccode='cd ~/Developer/code/'

alias ..='cd ..'
alias ...='cd ../..'
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# -a  -- list entries starting with .
# -x  -- sort horizontally
alias l='ls -ax'

# See https://github.com/gf3/dotfiles/blob/master/.aliases#L6
# brew install tree
alias ll='tree --dirsfirst -ChFupDaLg 1'

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

# Tree shortcuts
# brew install tree
# -a All files are printed.
#    By default tree does not print hidden files
# -L Max display depth of the directory tree.

# Laziness
alias t='tree'
# All files
alias ta='tree -a'
# All files limited to 2 levels deep
alias t2='tree -aL 2'
# All files limited to given depth
alias tl='tree -aL'

alias c='clear'
alias o='open .'
alias h="history"


# fasd
# brew install fasd
if [[ -f $HOME/.fasd ]]; then
  # jump to recently used items
  alias a='fasd -a' # any
  alias s='fasd -s' # show / search / select
  alias d='fasd -d' # directory
  alias f='fasd -f' # file
  alias z='fasd_cd -d' # cd, same functionality as j in autojump
  alias v='f -e vim' # quick opening files with vim
  alias s='f -e subl' # quick opening files with Sublime Text 2
fi


alias ..='cd ..'
alias ...='cd ../..'
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# -a  -- list entries starting with .
# -x  -- sort horizontally
alias l='ls -ax'

# See https://github.com/gf3/dotfiles/blob/master/.aliases#L6
# brew install tree
alias ll='tree --dirsfirst -ChFupDaLg 1'

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

# Tree shortcuts
# brew install tree
# -a All files are printed.
#    By default tree does not print hidden files
# -L Max display depth of the directory tree.

# Laziness
alias t='tree'
# All files
alias ta='tree -a'
# All files limited to 2 levels deep
alias t2='tree -aL 2'
# All files limited to given depth
alias tl='tree -aL'

alias c='clear'
alias o='open .'
alias h="history"


# fasd
# brew install fasd
if [[ -f $HOME/.fasd ]]; then
  # jump to recently used items
  alias a='fasd -a' # any
  alias s='fasd -s' # show / search / select
  alias d='fasd -d' # directory
  alias f='fasd -f' # file
  alias z='fasd_cd -d' # cd, same functionality as j in autojump
  alias v='f -e vim' # quick opening files with vim
  alias s='f -e subl' # quick opening files with Sublime Text 2
fi



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
