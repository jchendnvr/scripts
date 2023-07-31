#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# clone-prep.sh

# This script prepares the Ubuntu 20.04 LTS VM to be used as a clone. 

# This command should be run as root
if (($EUID != 0));
  then echo "Please run as root";
  exit;
fi
echo "Running as root ... !"

echo "Preparing clone"
echo "echo -n > /etc/machine-id 
rm /var/lib/dbus/machine-id 
ln -s /etc/machine-id /var/lib/dbus/machine-id
"

echo -n > /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

echo "What do you want the template hostname to be? "
read HN
echo "hostnamectl set-hostname $HN"
hostnamectl set-hostname $HN

echo "Do you want to set dhcp?"
echo "y/n, default is y"
read DHCPANS
if [ -z "$DHCPANS" ] || [ "$DHCPANS" == "y" ] || [ "$DHCPANS" == "Y" ]
then 
  $HOME/scripts/dhcp.sh
else 
  echo "Not changing netplan config. You may optionally run $HOME/scripts/static.sh"
fi




