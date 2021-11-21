#!/bin/bash 

cd ~/temp
git clone https://github.com/neovim/neovim
cd neovim 
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen -y
make -j4
sudo make install
