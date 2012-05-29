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

# One of @janmoesen’s ProTip™s
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
