#!/bin/bash

if ls $HOME/Downloads/reaper*_linux_x86_64.tar.xz 1> /dev/null 2>&1;
then
  set -x
  cd $HOME/Downloads
  tar xvf reaper*_linux_x86_64.tar.xz
  cd reaper_linux_x86_64
  sudo ./install-reaper.sh --install /opt --integrate-desktop --usr-local-bin-symlink
  cd ..
  rm -r reaper*_linux_x86_64*
  reaper & sleep 5; killall reaper
  echo "RECORD t/record
STOP t/stop
" > $HOME/.config/REAPER/OSC/transport.ReaperOSC
else
  echo
  echo "Reaper download not found in ~/Downloads."
  echo "Download Reaper for Linux x86_64 from https://www.reaper.fm/download.php"
  echo "into ~/Downloads (select 'Save File' option in Firefox) and run this script again."
  echo
fi


