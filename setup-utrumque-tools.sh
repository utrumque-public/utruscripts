#!/bin/bash

set -x

cd $HOME
[ ! -d "src" ] && mkdir src
cd src
[ ! -d "utrumque" ] && mkdir utrumque
cd utrumque

[ ! -d "utrulities" ] && git clone https://git.iem.at/utrumque/utrulities.git
[ ! -d "utruchord" ] && git clone https://git.iem.at/utrumque/utruchord.git
[ ! -d "st-elisabeth" ] && git clone https://git.iem.at/utrumque/st-elisabeth.git

ln -sf $HOME/src/utrumque $HOME/.local/share/SuperCollider/Extensions

cd /tmp
git clone https://git.iem.at/utrumque/jack_patch.git
cd jack_patch
make
sudo make install

