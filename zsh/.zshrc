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
privDir="$HOME/.private/"
if [[ -d $privDir ]]; then
  for script in "$privDir"/*; do
    [[ -f "$script" ]] && source "$script"
  done
fi

# -----------
# Keybindings
# -----------
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey "^[[3~" delete-char

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
alias rs=". ~/.local/bin/pmenu resume"
alias pk=". ~/.local/bin/pmenu kill"
alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"
alias jctl="journalctl -p 3 -xb"
alias aur="pacman -Qm"

# ----
# PATH
# ----
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/scripts/"

# ---------------
# LANGUAGE CONFIG
# ---------------
# Go
export PATH="$PATH:$HOME/go/bin/"

# NVM
nvm_file="/usr/share/nvm/init-nvm.sh"
[[ -f $nvm_file ]] && source $nvm_file 

# Cargo
cargo_file="$HOME/.cargo/env"
[[ -f $cargo_file ]] && source $cargo_file

# Dotnet
export PATH="$PATH:/home/sebas/.dotnet/tools"

# Opam
# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/sebas/.opam/opam-init/init.zsh' ]] || source '/home/sebas/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# GHCup
[ -f "/home/sebas/.ghcup/env" ] && . "/home/sebas/.ghcup/env" # ghcup-env

# Gerbil Scheme
export PATH="$PATH:/opt/gerbil/bin/"
export GERBIL_STD_LIB="/opt/gerbil/src/std"

# ----
# FLIP
# ----
export GHOSTTY_CONFIG=$HOME/.config/ghostty/config
export GHOSTTY_DARK="One Half Dark"
export GHOSTTY_LIGHT="One Half Light"
export HELIX_CONFIG=$HOME/.config/helix/config.toml
export HELIX_DARK="zed_onedark"
export HELIX_LIGHT="zed_onelight"

export CGO_ENABLED=1
