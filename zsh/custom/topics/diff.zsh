# Diff
# ====

# Aliases
# -------

# Functions
# ---------

function compare-dirs() {
  diff -qr $1 $2 | grep -v -e 'DS_Store' -e 'Thumbs' | sort
}