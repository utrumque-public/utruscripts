ls#!/bin/bash

set -x
sudo apt install vino -y
gsettings set org.gnome.Vino require-encryption false
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y
sudo apt update
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret -y
set +x

echo
echo "Left to do:"
echo
echo "  In Settings/Sharing activate 'Screen Sharing' and set"
echo "  a passwd under 'Access Options'. If you use a static"
echo "  network setup, use static IP also as gateway and DNS."
echo


