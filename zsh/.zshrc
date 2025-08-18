# ----------------------
# ZSH SCRIPTS & SETTINGS 
# ----------------------
# Highlighting, command correction, waiting dots
DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Ignore commands that start with spaces and duplicates.
export HISTCONTROL=ignoreboth

# Don't add certain commands to the history file.
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

# Use custom `less` colors for `man` pages.
export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Fish-like syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# pkgfile "command not found" handler
source /usr/share/doc/pkgfile/command-not-found.zsh

export FZF_BASE=/usr/share/fzf

# Source private configuration files.
for script in .private/*; do
  if [[ -f "$script" ]]; then
    source "$script"
  fi
done


# -----------
# Keybindings
# -----------
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word

# ------
# PROMPT
# ------
precmd() {
	GIT_PROMPT=$(go-git-prompt prompt)

	NEWLINE=$'\n'
	autoload -U colors && colors
	PROMPT="%{$fg[green]%}%n%{$reset_color%} %~ ${GIT_PROMPT}${NEWLINE}$ "
}

# -------
# ALIASES
# -------
alias lsd="lsd -l --color=never"
alias hx="helix"
alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"
alias jctl="journalctl -p 3 -xb"

# ----
# PATH
# ----
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/scripts/"

# ---------
# GENERATED
# ---------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

