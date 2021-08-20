#!/bin/bash

if ls $HOME/Downloads/juce*linux.zip 1> /dev/null 2>&1;
then
  set -x
  cd $HOME/Downloads
  rm -rf JUCE
  unzip juce*linux.zip
  
  sudo apt install libasound-dev libfreetype6-dev libgl1-mesa-dev libx11-dev libxext-dev libxinerama-dev libxcursor-dev freeglut3-dev libxmu-dev libxi-dev libfftw3-dev libsoxr-dev libgtk-3-dev libwebkit2gtk-4.0-dev libcurl4-gnutls-dev cmake cmake-curses-gui -y

  cd $HOME

  mkdir -p src
  cd src

  rm -rf mcfx
  git clone https://github.com/kronihias/mcfx.git

  rm -rf FST
  git clone https://git.iem.at/zmoelnig/FST.git

  mkdir -p $HOME/SDKs/VST3/pluginterfaces
  cp -r FST/fst $HOME/SDKs/VST3/pluginterfaces/vst2.x

  cd mcfx
  mkdir BUILD
  cd BUILD

  for CHANNELS in 2 4 8 16 24 32 36 50 64 
  do
    cmake -D NUM_CHANNELS=$CHANNELS ..
    make -j 16
  done
  cp _bin/*.so ~/.vst
  chmod -x ~/.vst/*.so
  
  cd $HOME/src
  rm -rf mcfx FST
  cd $HOME/Downloads
  rm -rf JUCE juce-linux.zip

else
  echo
  echo "JUCE was not found ~/Downloads."
  echo "Download package for Linux from https://juce.com/get-juce/download"
  echo "into ~/Downloads (select 'Save File' option in Firefox)"
  echo "and run this script again."
  echo
fi

