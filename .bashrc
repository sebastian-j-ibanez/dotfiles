#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Custom prompt
GIT_PS1_SHOWDIRTYSTATE='*'
. ~/dotfiles/Scripts/git-prompt.sh
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " [%s]")'; PS1='\[\e[94;1m\]\u\[\e[0m\] \[\e[35;1m\]\w\[\e[32;1m\]${PS1_CMD1}\[\e[0m\]\n$ '

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lsd='lsd -l --group-directories-first'
alias gitl='git log --graph --oneline --decorate'
