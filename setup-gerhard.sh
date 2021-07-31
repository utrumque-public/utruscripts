#!/bin/bash

set -x
sudo apt update
sudo apt upgrade -y
sudo apt install git -y
git config --global user.email "eckel@iem.at"
git config --global user.name "Gerhard Eckel"
git config --global credential.helper store

