#
# ~/.bash_profile
#

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Source ssh key
ssh-add ~/.ssh/id_ed25519

# Env variables
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" # For ssh-agent systemd process
export VISUAL="hx"

# Local bin
export PATH=$PATH:$HOME/.local/bin

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# GHCUP (Haskell)
export PATH=$PATH:$HOME/.ghcup/bin:$PATH/.cabal/bin
