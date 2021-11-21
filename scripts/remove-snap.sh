#!/bin/bash
#
# cf. https://www.kevin-custer.com/blog/disabling-snaps-in-ubuntu-20-04/
#
set -x
sudo snap remove snap-store
sudo snap remove gtk-common-themes
sudo snap remove gnome-3-34-1804
sudo snap remove core18
sudo snap remove snapd
snap list
sudo apt purge snapd -y
sudo apt autoremove -y

