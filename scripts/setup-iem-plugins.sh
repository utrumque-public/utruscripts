#!/bin/bash

set -x

sudo apt install libfreetype6-dev libx11-dev libxinerama-dev libxrandr-dev libxcursor-dev libxcomposite-dev libfontconfig1-dev libcurl4-gnutls-dev ladspa-sdk mesa-common-dev libasound2-dev freeglut3-dev -y

cd $HOME
mkdir -p src
cd src

rm -rf IEMPluginSuite
git clone https://git.iem.at/audioplugins/IEMPluginSuite.git

rm -rf FST
git clone https://git.iem.at/zmoelnig/FST
mkdir -p IEMPluginSuite/pluginterfaces
mv FST/fst IEMPluginSuite/pluginterfaces/vst2.x
rm -rf FST

set +x

echo
echo "Left to do (don't know how to automatise this):"
echo
echo "  (1) Download JUCE for Linux from 'https://juce.com/get-juce/download'"
echo "  and extract the ZIP archive into '~/src/IEMPluginSuite'."
echo "  (2) Run '~/src/IEMPluginSuite/JUCE/Projucer' and go to 'File -> Global Paths'."
echo "  Set 'Path to JUCE' to '~/src/IEMPluginSuite/JUCE' and"
echo "  set 'VST (Legacy) SDK' to '~/src/IEMPluginSuite' and close Projucer."
echo
echo "  (3) Run '~/src/IEMPluginSuite/linux_buildAll.sh'."
echo "  This last step takes a long time!"
echo

