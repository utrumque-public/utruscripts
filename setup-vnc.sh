ls#!/bin/bash

set -x
sudo apt install vino
gsettings set org.gnome.Vino require-encryption false
set +x
echo
echo "Left to do:"
echo
echo "  In Settings/Sharing acticate 'Screen Sharing' and set"
echo "  a passwd under 'Access Options'. If you use a static"
echo "  network setup, use static IP also as gateway and DNS."
echo


