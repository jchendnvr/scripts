#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# kill_ipv6.sh

# This script will disable IPv6 at reboot

# This command should be run as root
if (($EUID != 0));
  then echo "Please run as root";
  exit;
fi
echo "Running as root ... !"


echo " !! Killing IPv6 !!
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6

# /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1"
GRUB_CMDLINE_LINUX="ipv6.disable=1"

sudo update-grub
"

echo "Performing configuration"
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6
echo '
# DISABLING IPV6
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1"
GRUB_CMDLINE_LINUX="ipv6.disable=1"
' >> /etc/default/grub
update-grub

sleep 2
echo "
Complete
"
