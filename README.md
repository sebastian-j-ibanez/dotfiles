# . Dotfiles
This repo stores several config files. Dotfiles are managed using [GNU stow](https://github.com/aspiers/stow/).

## 🔧 Setup
1. Ensure dependencies are installed.
2. Clone repository in $HOME directory:
```
git clone https://github.com/sebastian-j-ibanez/dotfiles.git
```
3. Rename conflicting files currently in $HOME (eg. .bashrc, .bash_profile, .config/emacs/..)
4. Enter dotfiles directory and use [GNU stow](https://github.com/aspiers/stow/):
```
cd ~/dotfiles && stow .
```
5. Enjoy the setup 🧉

## ⚙️ Dependencies
```
stow  >= 2.4
bash  >= 5.2
lsd   >= 1.1
emacs >= 29
helix >= 24
```

Assuming you already have bash installed:

### Arch:
```
sudo pacman -S stow lsd emacs helix
```
