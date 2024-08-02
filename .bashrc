#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Custom prompt
GIT_PS1_SHOWDIRTYSTATE='*'
source ~/.scripts/git-prompt.sh
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " %s")'; PS1='\[\e[97m\]\u\[\e[0m\] \[\e[38;5;117m\]\w\[\e[38;5;210m\]${PS1_CMD1}\[\e[0m\]\n󰘧 '

# Aliases
alias lsd='lsd -l'
alias hx='helix'

