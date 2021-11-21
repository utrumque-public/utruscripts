#!/bin/bash

set -x

sudo apt update
sudo apt upgrade -y

sudo apt install git -y
git config --global user.email "ludvig@ludvigelblaus.com"
git config --global user.name "elblaus"
git config --global credential.helper store

sh scripts/setup-supercollider.sh
sh scripts/setup-neovim.sh

sudo apt install i3 kitty szh fzf neovim htop fonts-ibm-plex -y
sudo apt install audacity gimp mpv youtube-dl transmission -y
sudo apt install libreoffice pandoc texlive-latex-extra -y

zsh
nvim &
kitty &
scide &
killall nvim kitty scide 

cp ./ludvig-conf-files/startup.scd ~/.config/SuperCollider/startup.scd
cp ./ludvig-conf-files/kitty.conf ~/.config/kitty/kitty.conf
cp ./ludvig-conf-files/coc-settings.json ~/.config/nvim/coc-settings.json
cp ./ludvig-conf-files/init.vim ~/.config/nvim/init.vim

cp ./ludvig-conf-files/.aliases.sh ~/.aliases.sh
echo "source $HOME/.aliases.sh" | tee -a ~/.zshrc

sh scripts/setup-audio.sh
