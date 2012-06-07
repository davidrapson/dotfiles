# Network
# =======


# Aliases
# =======

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Add aliases for HTTP verbs
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# Toggle remote login on OS X
alias rup='systemsetup -setremotelogin on'
alias rdown='systemsetup -setremotelogin off'

# All users processes, only executable name, custom output, show processes with no controlling terminal
alias ps='ps -a -c -o pid,command -x'


# Functions
# =========

# Show both local and public IP addresses
fuction network() {
  echo -e "Local  IP: $(ifconfig en1 | grep -oP 'inet \K(\d{1,3}\.){3}\d{1,3}')"
  echo -e "Public IP: $(curl -s icanhazip.com)";
}

# Get local IP and copy it to the clipboard
function localip() {
  ifconfig en1 | grep -oP 'inet \K(\d{1,3}\.){3}\d{1,3}' | tr -d '\n' | tee >(pbcopy)
  echo '\nCopied to clipboard'
}

# Get public IP and copy it to the clipboard
function publicip() {
  curl -s icanhazip.com | tr -d '\n' | tee >(pbcopy)
  echo '\nCopied to clipboard'
}

# All the dig info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

# Just dig MX records
function mx() {
  dig "$1" mx
}

# Helper function to show all domain info
function domainme() {
  echo "\nWhois\n============================================\n"
  whois "$1"
  echo "\nDig\n============================================\n"
  digga "$1"
}
