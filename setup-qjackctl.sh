#!/bin/bash

set -x
VERSION=qjackctl-0.9.4 # from https://qjackctl.sourceforge.io/
cd $HOME
mkdir -p src
cd src
rm -rf $VERSION
wget -O - https://download.sourceforge.net/qjackctl/$VERSION.tar.gz | tar xvfz -
cd $VERSION
cmake -B build -s .
make -j 10 -C build
sudo make -C build install

