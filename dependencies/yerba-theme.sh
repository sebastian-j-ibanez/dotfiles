#! /usr/bin/bash

echo "      Installing Yerba theme..."

dest="$HOME/Code/yerba-theme"
mkdir -p "$dest"
git clone https://github.com/sebastian-j-ibanez/yerba-theme.git "$dest"
pwd=$PWD
cd "$dest" && ./install.sh helix ghostty
cd "$pwd" || exit

echo "      Yerba theme installed successfully"
