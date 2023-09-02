#!/bin/bash


set -x
	
# Install cpufrequtils and set governor to 'performance'

sudo apt install cpufrequtils -y
echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
sudo systemctl disable ondemand
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor 

# Set swappiness and max_user_watches

echo "
vm.swappiness=10
fs.inotify.max_user_watches=524288
" | sudo tee /etc/sysctl.conf

# Add user to audio and dialout groups 

sudo usermod -a -G audio $USER
sudo usermod -a -G dialout $USER

# Set RT prioriy

if ! grep -q "rtprio 95" /etc/security/limits.conf
then
echo "
@audio - memlock unlimited
@audio - rtprio 95
" | sudo tee -a /etc/security/limits.conf
fi

# Add threadirq flag to kernel parameters

sudo apt install rtirq-init -y
sudo sed -i 's/quiet splash"/quiet splash threadirqs"/g' /etc/default/grub
sudo update-grub 

# Install JACK

sudo echo "
@audio - memlock unlimited
@audio - rtprio 95
" | sudo tee /etc/security/limits.d/audio.conf 

sudo apt install jackd -y

set +x

echo
echo "LEFT TO DO:"
echo
echo " Reboot and run 'sh check-audio-setup.sh' afterwards."
echo

