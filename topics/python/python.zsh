# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true;

function gpip() {
   PIP_REQUIRE_VIRTUALENV=false;
   pip "$@"
}

if hash bpython 2>/dev/null; then
  alias py=bpython
else
  alias py=python
fi
