#! /usr/bin/bash

echo "      Installing go-git-prompt"

dest="$HOME/Code/go-git-prompt"
mkdir -p "$dest"
git clone https://github.com/sebastian-j-ibanez/go-git-prompt.git "$dest"
pwd=$PWD
cd "$dest" && ./build/local-build.sh
cd "$pwd" || exit

echo "      go-git-prompt installed successfully"
