#! /usr/bin/bash

# Interactive install script for dotfile dependencies.

# Print help message
print_help() {
    echo "Usage: setup.sh [OPTIONS]"
    echo ""
    echo "Interactive install script for dotfiles dependencies"
    echo ""
    echo "Options:"
    echo "  -h, --help       Show this help message"
    echo "  -p, --packages   List base packages"
}

# Print base packages
print_packages() {
    mapfile -t packages < <(grep -v '^#' dependencies/base.packages | grep -v '^$')
    echo "Base packages:"
    printf "  %s\n" "${packages[@]}"
}

# Confirm setup step
confirm() {
    local prompt="$1"
    local response
    
    read -p "$prompt (y/n): " -r response
    case "$response" in
        [Yy]) return 0 ;;
        [Nn]|"") return 1 ;;  # default to no
        *)
            echo "Invalid input. Please enter y or n."
            confirm "$prompt"
            ;;
    esac
}

# Parse command line arguments
case "$1" in
    -h|--help)
        print_help
        exit 0
        ;;
    -p|--packages)
        print_packages
        exit 0
        ;;
esac

# Display setup logo
./utils/install-banner.sh

# Install packages
mapfile -t packages < <(grep -v '^#' dependencies/base.packages | grep -v '^$')
if confirm "[1/5] Would you like to install base packages?"; then
  rudo pacman -S "${packages[@]}"
fi

if confirm "[2/5] Would you like to install Rust via rustup?"; then
  ./dependencies/rustup.sh
fi

if confirm "[3/5] Would you like to install VS Code?"; then
  ./dependencies/vscode.sh
fi

if confirm "[4/5] Would you like to install go-git-prompt?"; then
  ./dependencies/go-git-prompt.sh
fi

if confirm "[5/5] Would you like to install shell utilities?"; then
  ./dependencies/shell-utils.sh
fi

printf "\nInstall complete 🧉\n"
