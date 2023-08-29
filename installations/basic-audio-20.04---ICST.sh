#!/bin/bash
#
# Installation script for a Linux audio setup with an SCNVim workflow.
# Primarily made for the Incuses at ICST but works as basic install.
# Should run in ~30 minutes without user interaction.

set +x

# UPDATE
sudo apt update && sudo apt upgrade -y
sudo apt install fonts-ibm-plex git kitty curl qpwgraph ripgrep -y

## OH MY ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# SSH
sudo apt install ssh -y
sudo systemctl restart ssh.service
systemctl status ssh.service

# SOURCE DIRECTORY
cd ~
mkdir src

# SETUP VIM
cd ~/src
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sudo apt install ninja-build gettext cmake unzip curl -y
git clone https://github.com/neovim/neovim
cd neovim && make -j3 CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# SUPERCOLLIDER
cd ~/src
sudo apt install build-essential cmake libjack-jackd2-dev libsndfile1-dev libfftw3-dev libxt-dev libavahi-client-dev -y
sudo apt install libudev-dev qtbase5-dev qt5-qmake qttools5-dev qttools5-dev-tools qtdeclarative5-dev libqt5svg5-dev libqt5websockets5-dev qtwebengine5-dev -y
git clone --recurse-submodules https://github.com/SuperCollider/SuperCollider.git
cd SuperCollider
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DNATIVE=ON -DSC_EL=OFF ..
make -j3
sudo make install

# DOTFILES
cd ~/src
git clone https://github.com/elblaus/dotfiles
cd dotfiles
sh ./install.sh

# PIPEWIRE JACK
sudo apt install pipewire-jack qpwgraph -y
sudo cp /usr/share/doc/pipewire/examples/ld.so.conf.d/pipewire-jack-x86_64-linux-gnu.conf /etc/ld.so.conf.d/
sudo ldconfig

# AUDIO TUNING
sudo usermod -a -G audio $USER
sudo usermod -a -G dialout $USER

if ! grep -q "rtprio 95" /etc/security/limits.conf
then
echo "
@audio - memlock unlimited
@audio - rtprio 95
" | sudo tee -a /etc/security/limits.conf
fi

sudo apt install rtirq-init -y
sudo sed -i 's/quiet splash"/quiet splash threadirqs"/g' /etc/default/grub
sudo update-grub

sudo echo "
@audio - memlock unlimited
@audio - rtprio 95
" | sudo tee /etc/security/limits.d/audio.conf
