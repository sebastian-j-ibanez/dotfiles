#! /bin/bash
# Update system
pacman -Syyu --noconfirm
# Update mirror list
pacman -S --noconfirm reflector
reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
# Install essential packages
pacman -S --noconfirm timeshift grub-btrfs git kitty lsd emacs helix clangd go gopls delve
