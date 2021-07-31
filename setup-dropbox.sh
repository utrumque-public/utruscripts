#!/bin/bash

set -x
cd
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - .dropbox-dist/dropboxd
wget "https://linux.dropbox.com/packages/dropbox.py"
sudo mv dropbox.py /usr/bin/dropbox
sudo chown root:root /usr/bin/dropbox
sudo chmod 755 /usr/bin/dropbox
ln -sf ~/Dropbox/utrumque .utrumque
set +x

echo
echo "LEFT TO DO:"
echo
echo " Install a link in home directoy named Dropbox pointing to the Dropbox directory."
echo " E.g. ln -s /media/utrumque/data/Dropbox ~"
echo " Then start Dropbox with 'dropbox start'"
echo

