#! /usr/bin/zsh

stow --adopt -t ~ zsh
stow --adopt -t ~ ghostty
stow --adopt -t ~ git
stow --adopt -t ~ helix

git checkout .
