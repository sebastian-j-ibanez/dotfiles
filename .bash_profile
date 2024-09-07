#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export VISUAL="helix"
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
