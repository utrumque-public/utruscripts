#!/bin/bash

sudo apt install cpufrequtils -y
if ! grep performance
echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
sudo systemctl disable ondemand
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor 

