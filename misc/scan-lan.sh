#!/bin/bash

IP="${1:-192.168.0.0}"
echo "Scanning LAN"
echo "My IPs are:"
nmcli | grep inet4
echo "Scanning $IP/24"
nmap $IP/24
