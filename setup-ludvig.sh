#!/bin/bash

set -x
sudo apt update
sudo apt upgrade -y
sudo apt install git -y
git config --global user.email "ludvig@ludvigelblaus.com"
git config --global user.name "elblaus"
git config --global credential.helper store

