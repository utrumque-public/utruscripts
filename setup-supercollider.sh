#!/bin/bash

set -x

sudo apt install emacs build-essential cmake libjack-jackd2-dev libsndfile1-dev libfftw3-dev libxt-dev libavahi-client-dev git libasound2-dev libicu-dev libreadline6-dev libudev-dev pkg-config libncurses5-dev qt5-default qt5-qmake qttools5-dev qttools5-dev-tools qtdeclarative5-dev qtwebengine5-dev libqt5svg5-dev libqt5websockets5-dev -y
cd $HOME
[ ! -d "src" ] && mkdir src
cd src
git clone --recurse-submodules --branch Version-3.11.2 https://github.com/SuperCollider/SuperCollider.git
cd SuperCollider
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release DNATIVE=ON ..
make -j
sudo make install 

