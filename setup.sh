#! /usr/bin/bash

# Download go-git-prompt
bin="$HOME/.local/bin"
mkdir -p $bin 
curl -Lo $bin/go-git-prompt https://github.com/sebastian-j-ibanez/go-git-prompt/releases/download/v0.2.0/go-git-prompt-v0.2-linux-amd64 
chmod +x $bin/go-git-prompt


# Download dependencies
sudo pacman -S git ghostty stow ttf-firacode-nerd zsh 
