#!/bin/bash

set -x
cd /tmp
git clone https://github.com/raboof/realtimeconfigquickscan.git
cd realtimeconfigquickscan
perl ./realTimeConfigQuickScan.pl

