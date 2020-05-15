# Auto LS
function chpwd() { ls -A; }

# Mkdir and CD automatically
function mkcd() { mkdir "$1" && cd "$1"; }

# Python virtual environments
function pyve() { python3 -m venv venv; }
function pyva() { source ./venv/bin/activate; }

# Locate file/folder and cd to it
function cdf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]; then
    if [[ -d $file ]]; then
      cd -- $file
    else
      cd -- ${file:h}
    fi
  fi
}

# Locate file and cat it
function catf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -r $file ]]; then
    cat $file
  fi
}
