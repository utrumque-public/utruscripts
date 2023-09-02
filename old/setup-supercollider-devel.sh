#!/bin/bash

set -x


sudo apt install build-essential cmake libjack-jackd2-dev libsndfile1-dev libfftw3-dev libxt-dev libavahi-client-dev -y

sudo apt install emacs git libasound2-dev libicu-dev libreadline6-dev libudev-dev pkg-config libncurses5-dev -y

sudo apt install qtbase5-dev qt5-qmake qttools5-dev qttools5-dev-tools qtdeclarative5-dev libqt5svg5-dev libqt5websockets5-dev qtwebengine5-dev -y

cd $HOME
mkdir -p src
cd src
rm -rf SuperCollider
git clone --recurse-submodules https://github.com/SuperCollider/SuperCollider.git
cd SuperCollider

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DNATIVE=ON ..
make -j 8
sudo rm -rf /usr/local/share/SuperCollider
sudo make install
scide & sleep 3; killall scide
set +x

echo
echo Installed SuperCollider developent version
echo

