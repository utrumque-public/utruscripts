#!/bin/bash

sudo apt install emacs build-essential cmake libjack-jackd2-dev libsndfile1-dev libfftw3-dev libxt-dev libavahi-client-dev git libasound2-dev libicu-dev libreadline6-dev libudev-dev pkg-config libncurses5-dev qt5-default qt5-qmake qttools5-dev qttools5-dev-tools qtdeclarative5-dev qtwebengine5-dev libqt5svg5-dev libqt5websockets5-dev -y

cd tmp
git clone --recurse-submodules https://github.com/SuperCollider/SuperCollider.git
cd SuperCollider
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release DNATIVE=ON ..
make -j
sudo make install 

