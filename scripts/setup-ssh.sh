#!/bin/bash

set -x
sudo apt install ssh -y
sudo systemctl restart ssh.service 
systemctl status ssh.service
#ssh-keygen -t rsa
set +x

#echo
#echo "LEFT TO DO ONCE THE LOCAL NETWORK IS CONFIGURED:"
#echo
#echo " ssh-copy-id <remoteIP>"
#echo

