#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Custom prompt
GIT_PS1_SHOWDIRTYSTATE='*'
. "${HOME}/dotfiles/Scripts/git-prompt.sh"
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " [%s]")'; PS1='\[\e[32m\]\u🧉\h\[\e[0m\] \w\[\e[1m\]${PS1_CMD1}\[\e[0m\]\n$ '

# Aliases
alias grep='grep --color=auto'
alias ls='ls -l --color=auto'
alias lsd='lsd -l --group-directories-first'
alias gitl='git log --graph --oneline --decorate'
alias mk='./.devcontainer/development/scripts/make'

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env

