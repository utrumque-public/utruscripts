#!/bin/bash

if ls $HOME/Downloads/dropbox_*_amd64.deb 1> /dev/null 2>&1;
then
  set -x
  cd $HOME/Downloads
  sudo dpkg -i dropbox_*_amd64.deb
  rm dropbox_*_amd64.deb
  ln -sf ~/Dropbox/utrumque ~/.utrumque  
  set +x  
  echo
  echo "LEFT TO DO:"
  echo
  echo " Install a link in home directoy named Dropbox pointing to the Dropbox directory."
  echo " E.g. ln -s /media/utrumque/data/Dropbox ~"
  echo " After a breif delay, you will be asked to start Dropbox."
  echo " If not, start Dropbox with 'dropbox start'"
 echo
else
  echo
  echo "Dropbox package not found in ~/Downloads."
  echo "Download package for Ubuntu from https://www.dropbox.com/install"
  echo "into ~/Downloads (select 'Save File' option in Firefox)"
  echo "and run this script again."
  echo
fi

