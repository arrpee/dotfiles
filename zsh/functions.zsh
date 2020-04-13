# Auto LS
function chpwd () { ls -A }

# Mkdir and CD automatically
function mkcd() { mkdir "$1" && cd "$1"; }

# Python virtual environments
function pyve() { python3 -m venv venv }
function pyva() { source ./venv/bin/activate }