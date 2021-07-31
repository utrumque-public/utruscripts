#!/bin/bash

set -x
sudo apt install ssh -y
sudo systemctl restart ssh.service 
systemctl status ssh.service
set +x

echo
echo "LEFT TO DO:"
echo
echo " On remote machine run:"
echo " ssh-copy-id -i ~/.ssh/id_rsa.pub <user>@<hostname>"
echo

