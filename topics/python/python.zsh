# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true;

function gpip() {
   PIP_REQUIRE_VIRTUALENV=false;
   pip "$@"
}
