# Scripts
alias awr="awesome-client 'awesome.restart()'"
alias awt="Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome"

# Shortcuts
alias cl='clear'
alias e='exit'
alias g='git'
alias tm='tmux'
alias cx='chmod +x'

# Tmux aliases
alias ta='tmux attach'
alias tan='tmux attach -t'
alias tn='tmux new-session'
alias tnn='tmux new-session -s'
alias tls='tmux list-sessions'
alias tkill='tmux kill-server'

# App Defaults
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"
alias mkdir="mkdir -p"
alias ls="LC_COLLATE=C ls --group-directories-first --color=auto"
alias tldr="tldr -t base16"
alias tmux="tmux -u"
alias uptime="uptime -p"
alias dd="echo Don\'t use dd, dummy."

# Python
alias pyve="python3 -m venv venv"
alias pyva="source ./venv/bin/activate"

# Stuff
alias :q='echo You are not editing a file, dummy.'
alias :wq=':q'
