#! /usr/bin/bash

dest="$HOME/Code/go-git-prompt"
mkdir -p "$dest"
git clone https://github.com/sebastian-j-ibanez/go-git-prompt.git "$dest"
pwd=$PWD
cd "$dest" && ./build/local-build.sh
cd "$pwd" || exit
