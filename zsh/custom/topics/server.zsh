# Server
# ======

# Start up a local server for the current directory
# Defaults to port 8000 but you can pass a port number as an argument
# Automatically open a browser window for the local server
function local_server() {
  open "http://localhost:${1:-8000}" && python -m SimpleHTTPServer ${1:-8000}
}

# Start up a public server (using show.io through the show gem) for the current directory
function public_server() {
  python -m SimpleHTTPServer 8080 &
  show 8080
}

# Open up a web page at http://localhost:8808/ with info about installed gems
function gem_server() {
  open "http://localhost:8808" && gem server
}
