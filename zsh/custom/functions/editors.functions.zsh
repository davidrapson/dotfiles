# File Editing
# ============

# Open a given file with Mou.app
function mou() {
  open -a Mou $1
}

function compare-dirs() {
  diff -qr $1 $2 | grep -v -e 'DS_Store' -e 'Thumbs' | sort
}
