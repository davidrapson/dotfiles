# Man Pages
# =========

# Open man page in Preview
function pman() {
  man -t "${1}" | open -f -a Preview
}

# Open man page in TextMate
function tman() {
  MANWIDTH=160 MANPAGER='col -bx' man $@ | mate
}
