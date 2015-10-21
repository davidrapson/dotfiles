# Server
# ======

# Start up a local server for the current directory.
# Defaults to port 8000
function local_server() {
  open "http://localhost:${1:-8000}" && python -m SimpleHTTPServer ${1:-8000}
}

# Start up a public server for the current directory using ngrok
# brew install ngrok
function public_server() {
  python -m SimpleHTTPServer 8080 &
  ngrok 8080
}
