# Network
# =======

# Aliases
# -------

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
# alias flush=""

OSXVERSION=$(sw_vers | grep ProductVersion | cut -c 17-20)
function flush() {
  if [[ OSXVERSION -eq '10.8' ]]; then
    sudo killall -HUP mDNSResponder
  else
    dscacheutil -flushcache
  fi
}

# View HTTP traffic
# brew install ngrep
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Add aliases for HTTP verbs
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# All users processes, only executable name, custom output, show processes with no controlling terminal
alias ps='ps -a -c -o pid,command -x'

# Functions
# ---------

# Show both local and public IP addresses
function network() {
  echo -e "Local  IP: $(ipconfig getifaddr en0)"
  echo -e "Public IP: $(curl -s icanhazip.com)";
}

# Get local IP and copy it to the clipboard
function localip() {
  # ifconfig en0 | grep inet | grep -v inet6 | cut -c 7-17
  ipconfig getifaddr en0 | tr -d '\n' | tee >(pbcopy)
  echo '\nLocal IP copied to the clipboard'
}

# Get public IP and copy it to the clipboard
function publicip() {
  curl -s icanhazip.com | tr -d '\n' | tee >(pbcopy)
  echo '\nPublic IP copied to the clipboard'
}

# All the dig info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

# Just dig MX records
function mx() {
  dig "$1" mx
}
