#!/bin/bash

set -x
sudo snap remove snap-store
sudo snap remove gtk-common-themes
sudo snap remove gnome-3-34-1804
sudo snap remove core18
sudo snap remove snapd
sudo apt purge snapd -y


