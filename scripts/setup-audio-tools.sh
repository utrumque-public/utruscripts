#!/bin/bash
set -x
sudo apt install audacity jconvolver zita-njbridge sndfile-programs iem-plugin-suite-vst -y
mkdir -p ~/.vst
cp /usr/lib/x86_64-linux-gnu/iem-plugin-suite/vst/*.so ~/.vst

