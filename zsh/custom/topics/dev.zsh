# Dev
# ===

# Aliases
# -------

# Functions
# ---------

function compare-dirs() {
  diff -qr $1 $2 | grep -v -e 'DS_Store' -e 'Thumbs' | sort
}

# Open man page in Preview
function pman() {
  man -t "${1}" | open -f -a Preview
}

# Open man page in editor (Sublime Text)
function eman() {
  MANWIDTH=160 MANPAGER='col -bx' man $@ | subl
}
