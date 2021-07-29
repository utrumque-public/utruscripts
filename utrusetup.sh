#!/bin/bash

# asssumed:
# install and configure git
# install an dconfigure Dropbox (.utrumque link)

sudo apt update
sudo apt upgrade -y
sudo apt install git -y

# DROPBOX

cd
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - .dropbox-dist/dropboxd

# CPUFREQUTILS

sudo apt install cpufrequtils -y
echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
sudo systemctl disable ondemand
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor 

# SET SWAPPINESS

sudo echo "
vm.swappiness=10
fs.inotify.max_user_watches=524288
" | sudo tee /etc/sysctl.conf

# AUDIO GROUP

sudo usermod -a -G audio $USER
sudo usermod -a -G dialout $USER

# RT PRIORITY

if ! grep -q "rtprio 95" /etc/security/limits.conf
then
sudo echo "
@audio - memlock unlimited
@audio - rtprio 95
" | sudo tee -a /etc/security/limits.conf
fi

# INSTALL JACK

sudo echo "
@audio - memlock unlimited
@audio - rtprio 95
" | sudo tee /etc/security/limits.d/audio.conf 
sudo apt install jackd -y

# COMPILE SUPERCOLLIDER

sudo apt install emacs build-essential cmake libjack-jackd2-dev libsndfile1-dev libfftw3-dev libxt-dev libavahi-client-dev git libasound2-dev libicu-dev libreadline6-dev libudev-dev pkg-config libncurses5-dev qt5-default qt5-qmake qttools5-dev qttools5-dev-tools qtdeclarative5-dev qtwebengine5-dev libqt5svg5-dev libqt5websockets5-dev -y

cd tmp
git clone --recurse-submodules https://github.com/SuperCollider/SuperCollider.git
cd SuperCollider
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release DNATIVE=ON ..
make -j
sudo make install 

# INSTALL REAPER

cd tmp
tar xvf reaper<XXX>_linux_x86_64.tar.xz cd reaper_linux_x86_64 ./install-reaper.sh 


# REALTIME CHECK

cd /tmp
git clone git://github.com/raboof/realtimeconfigquickscan.git
cd realtimeconfigquickscan
perl ./realTimeConfigQuickScan.pl

# Add threadirq flag to kernel parameters

sudo apt install rtirq-init -y
sudo sed -i 's/quiet splash"/quiet splash threadirqs"/g' /etc/default/grub
sudo update-grub 

# THE REST

sudo apt install audacity jconvolver zita-njbridge -y

# Install and enable SSH

sudo apt install ssh -y
systemctl status ssh.service
sudo systemctl restart ssh.service 

# GIT CLONES

cd ~/.utrumque/../utrumque-local/git

git clone https://git.iem.at/utrumque/utrulities.git
git clone https://git.iem.at/utrumque/utruchord.git
git clone https://git.iem.at/utrumque/st-elisabeth.git

cd ~/.local/share/SuperCollider/Extensions
ln -s ~/.utrumque/../utrumque-local/git/utrulities .
ln -s ~/.utrumque/../utrumque-local/git/utruchord .

cd /tmp
git clone https://git.iem.at/utrumque/jack_patch.git
cd jack_patch
make
sudo make install

# FINAL MESSAGE

echo "

Left to do:

Install Reaper from https://www.reaper.fm/download.php

cd ~/Downloads
tar xvf reaper<XXX>_linux_x86_64.tar.xz
cd reaper_linux_x86_64
./install-reaper.sh

git config --global user.email \"<email>\"
git config --global user.name \"<first> <last>\"
git config --global credential.helper store

On remote machine:
ssh-copy-id -i ~/.ssh/id_rsa.pub <user>@<hostname>

"

