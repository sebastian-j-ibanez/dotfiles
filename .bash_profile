#
# ~/.bash_profile
#

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Environment variables
export VISUAL="helix"
export GOPATH=$HOME/go

# Path
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$HOME/.ghcup/bin:$PATH/.cabal/bin
