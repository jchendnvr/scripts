#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# dhcp.sh


# this script will configure DHCP on Ubuntu 20.04 LTS

# This command should be run as root
if (($EUID != 0));
  then echo "Please run as root";
  exit;
fi
echo "Running as root ... !"

echo "This script creates the default DHCP config for netplan" 
echo "Please see below."

echo "network:
  ethernets:
    ens192:
      dhcp4: true
      dhcp-identifier: mac
  version: 2
" > /etc/netplan/00-installer-config.yaml
cat /etc/netplan/00-installer-config.yaml

echo "running netplan apply"
netplan apply
echo "complete"
