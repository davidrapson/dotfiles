# Network
# =======

# Show both local and remote IP addresses
fuction network() {
  echo -e "Local  IP: $(ifconfig en1 | grep -oP 'inet \K(\d{1,3}\.){3}\d{1,3}')"
  echo -e "Public IP: $(curl -s icanhazip.com)";
}

# All the dig info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

function mx() {
  dig "$1" mx
}
