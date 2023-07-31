#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# static.sh

# this script will configure STATIC IP on Ubuntu 20.04 LTS

# This command should be run as root
if (($EUID != 0));
  then echo "Please run as root";
  exit;
fi
echo "Running as root ... !"

if [ "$1" == '-h' ] || [ "$1" == '?' ] || [ "$1" == '--help' ]
then
  echo "This script can be run interactively or by passing arguments."
  echo "The arguments you must pass in this order are: "
  echo "  IP ADDRESS\n  CIDR MASK\n  GATEWAY ADDRESS\n  COMMA SEPARATED DNS in quotes\n  SEARCH DOMAIN"
  exit
fi


if [ -z $5 ]
then
  echo "Running Interactively ... !"
  echo "This script will configure static IP address."
  echo "What do you want the IP address to be?" 
  echo "eg: 192.168.30.30"
  echo "IP: "
  read IPADDR
  echo "What do you want the MAC CIDR address to be?"
  echo "eg: 24"
  echo "MAC: "
  read MACADDR
  echo "What is the gateway?"
  echo "eg: 192.168.30.1"
  echo "Gateway: "
  read GWADDR
  echo "Enter single or comma separated DNS servers."
  echo "eg: 192.168.15.8, 192.168.15.9"
  echo "DNS: "
  read DNSADDR
  echo "Enter the search domain please."
  echo "eg: dnvr.red"
  echo "Search: "
  read SEARCHDOM
else
  IPADDR="$1"
  MACADDR="$2"
  GWADDR="$3"
  DNSADDR="$4"
  SEARCHDOM="$5"
fi


if [ -z "$IPADDR" ]
then
  echo "You must set an IP address"
  exit
fi
if [ -z "$MACADDR" ]
then
  echo "No MAC set so setting to default 24"
  MACADDR="24"
fi
if [ -z "$GWADDR" ]
then
  echo "You must set a gateway"
  exit
fi
if [ -z "$DNSADDR" ]
then
  echo "DNS addresses not set, setting to default."
  echo "192.168.15.8, 192.168.15.9"
  DNSADDR="192.168.15.8, 192.168.15.9"
fi
if [ -z "$SEARCHDOM" ]
then 
  echo "No Search DOMAIN set, setting to dnvr.red."
  SEARCHDOM="dnvr.red"  
fi

echo "network:
  ethernets:
    ens192:
      dhcp4: no
      addresses:
        - $IPADDR/$MACADDR
      gateway4: $GWADDR
      nameservers:
        search: [$SEARCHDOM]
        addresses: [$DNSADDR]
      dhcp-identifier: mac
  version: 2
" > /etc/netplan/00-installer-config.yaml
cat /etc/netplan/00-installer-config.yaml

echo "running netplan apply"
netplan apply
echo "complete"
