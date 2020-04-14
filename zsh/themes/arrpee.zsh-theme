# Directory info.
current_dir='${PWD/#$HOME/~}'
git_info='$(git_prompt_info)'

# Lineup/down
_lineup=$'\e[1A'
_linedown=$'\e[1B'

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$reset_color%}%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=":%{$fg[green]%} ▲"
ZSH_THEME_GIT_PROMPT_DIRTY=":%{$fg[red]%} △"

PROMPT="%{$fg[blue]%}%m %{$reset_color%}» \
%{$fg[cyan]%}%n \
%{$fg[white]%}in \
%{$fg_bold[cyan]%}[${current_dir}]%{$reset_color%}%{$reset_color%} \
${git_info}%{$reset_color%}
%{$fg[magenta]%}[%*] \
%{$fg[white]%}%{$reset_color%} "