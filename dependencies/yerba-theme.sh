#! /usr/bin/bash

echo "      Installing Yerba theme..."

dest="$HOME/Code/yerba-theme"
if [ -d "$dest/.git" ]; then
  echo "      Yerba theme already cloned, pulling latest..."
  git -C "$dest" pull
else
  mkdir -p "$dest"
  git clone https://github.com/sebastian-j-ibanez/yerba-theme.git "$dest"
fi
pwd=$PWD
cd "$dest" && ./install.sh helix ghostty
cd "$pwd" || exit

echo "      Yerba theme installed successfully"
