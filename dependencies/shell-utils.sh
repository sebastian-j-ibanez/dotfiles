#! /usr/bin/bash

echo "      Installing shell utils..."

dest="$HOME/shell-utils"
mkdir -p "$dest"
git clone https://github.com/sebastian-j-ibanez/shell-utils.git "$dest"

echo "      Shell utils installed successfully"
