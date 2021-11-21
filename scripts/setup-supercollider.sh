#!/bin/bash

set -x

if [ $# -eq 0 ]
then
  SC_VERSION=Version-3.12.0
else
  SC_VERSION=$1
fi

sudo apt install emacs build-essential cmake libjack-jackd2-dev libsndfile1-dev libfftw3-dev libxt-dev libavahi-client-dev git libasound2-dev libicu-dev libreadline6-dev libudev-dev pkg-config libncurses5-dev qt5-default qt5-qmake qttools5-dev qttools5-dev-tools qtdeclarative5-dev qtwebengine5-dev libqt5svg5-dev libqt5websockets5-dev -y

cd $HOME
mkdir -p src
cd src
rm -rf SuperCollider
git clone --recurse-submodules --branch $SC_VERSION https://github.com/SuperCollider/SuperCollider.git
cd SuperCollider

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release DNATIVE=ON ..
make -j 10
sudo rm -rf /usr/local/share/SuperCollider
sudo make install
scide & sleep 3; killall scide
set +x

echo
echo Installed SuperCollider $SC_VERSION
echo

