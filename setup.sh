#! /usr/bin/bash

echo "| Starting setup..."

# Download go-git-prompt
echo "| Installing go-git-prompt..."
bin="$HOME/.local/bin"
mkdir -p "$bin" 
curl -Lo "$bin"/go-git-prompt https://github.com/sebastian-j-ibanez/go-git-prompt/releases/download/v0.2.0/go-git-prompt-v0.2-linux-amd64 
chmod +x "$bin"/go-git-prompt
echo "✓ Install successful"

# Download dependencies
echo "| Installing pacman packages..."
dependencies=(
  "chromium"
  "git"
  "github-cli"
  "ghostty"
  "go"
  "gopls"
  "helix"
  "stow"
  "ttf-firacode-nerd"
  "vesktop"
  "yay"
  "zig"
  "zls"
)
sudo pacman -Sy "${dependencies[@]}"
echo "✓ Packages installed successfully."

echo "| Installing AUR packages..."
aur_dependencies=(
  "visual-studio-code-bin"
)
yay -Sy "${aur_dependencies[@]}"
echo "✓ Packages installed successfully."

