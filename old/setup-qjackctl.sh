#!/bin/bash

set -x

VERSION=qjackctl-0.9.4 # from https://qjackctl.sourceforge.io/

# see also https://github.com/rncbc/qjackctl

# this is only a guess and would need to be verified with a vanilla ubuntu install
sudo apt install build-essential cmake libjack-jackd2-dev qt5-qmake qttools5-dev qttools5-dev-tools qtdeclarative5-dev -y

cd $HOME
mkdir -p src
cd src
rm -rf $VERSION
wget -O - https://download.sourceforge.net/qjackctl/$VERSION.tar.gz | tar xvfz -
cd $VERSION
cmake -B build -s .
make -j 10 -C build
sudo make -C build install

