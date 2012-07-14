# Prompt
# ======

# Aliases
# -------

# Functions
# ---------

# Prompt character to signify version control system
# ± for Git, ☿ for Mercurial and ○ for no vcs.
function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  echo '○'
}
