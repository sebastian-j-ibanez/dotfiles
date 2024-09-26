#
# ~/.bash_profile
#

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Env variables
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" # For ssh-agent systemd process
export VISUAL="hx"
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$HOME/.ghcup/bin:$PATH/.cabal/bin
