#!/bin/bash

# verbose
set -x

# get up to dat
sudo apt update
sudo apt upgrade -y

# setup git
sudo apt install git -y
git config --global user.email "ludvig@ludvigelblaus.com"
git config --global user.name "elblaus"
git config --global credential.helper store

# compile and install supercollider
sh scripts/setup-supercollider.sh

# compile and install neovim 
sh scripts/setup-neovim.sh

# install from apt
sudo apt install i3 kitty szh fzf htop tree fonts-ibm-plex tldr -y
sudo apt install audacity gimp mpv vlc youtube-dl transmission -y
sudo apt install libreoffice pandoc texlive-latex-extra -y
sudo apt install jack-stdio pulseaudio-module-jack -y
sudo apt install gnome-tweaks hardinfo -y

# start software to create config paths and files 
zsh
nvim &
kitty &
killall nvim kitty

# overwrite config files
cp ./ludvig-conf-files/startup.scd ~/.config/SuperCollider/startup.scd
cp ./ludvig-conf-files/kitty.conf ~/.config/kitty/kitty.conf
cp ./ludvig-conf-files/coc-settings.json ~/.config/nvim/coc-settings.json
cp ./ludvig-conf-files/init.vim ~/.config/nvim/init.vim

# add aliases and link from zshrc 
cp ./ludvig-conf-files/.aliases.sh ~/.aliases.sh
echo "source $HOME/.aliases.sh" | tee -a ~/.zshrc

sh scripts/setup-audio.sh
