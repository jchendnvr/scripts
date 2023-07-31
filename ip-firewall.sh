#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731

# The purpose of this script is to query a dynamic DNS entry for its current IP.
# It should then set a firewall rule allowing traffic from that IP.
# The existing ip will be stored in a file. 
# If the IP changes it should delete the previous rule.
# If the IP has not changed, it should do nothing. 
# This then gets added as a cronjob every 1 minute. 
# The end result being a dynamic public IP could be the only IP allowed SSH 
# access. 

# must be run as root to work. 
# Remember to add to cronjob. 
# Modify these values as needed. 
ddns="example.com"
trackingfile="ip-firewall-example.txt"

# crontab
# /etc/crontab
# add something like below for every 5 minutes. 
# this puts the ip-firewall.txt file in /root/ dir by default
# */5 * * * * root /path/to/file/ip-firewall.sh

# You can create a script and tracking file for each user that would need access, 
# allowing you to let multiple users on separate dynamicdns domains. 
# eg ip-firewall-example.sh creating ip-firewall-example.txt tracking file.
# and ip-firewall-example2.sh creating ip-firewall-example2.txt tracking file.


# first check if the tracking file exists, and create if it doesn't to prevent error
if [ ! -f $trackingfile ]
then
  touch $trackingfile
fi


ipaddr=$(dig +short $ddns)

echo "The IP is $ipaddr"

echo "step 1"
# if ip ufw rule not found then allow
if ! ufw status | grep -q $ipaddr ; 
then
  echo "ufw allow from $ipaddr"
  ufw allow from $ipaddr
  echo "step 2"
fi

echo "step 2"
# check if old entry is allowed and remove if it is by rule number
# only remove it if there is a rule though. 
tempip=$(cat $trackingfile)
if [ "$ipaddr" != "$tempip" ] && [ ! -z $tempip ]
then
  if ufw status | grep -q $tempip ;
  then
    delrule=$(ufw status numbered | grep $tempip | awk -F '[' '{print $2}' | awk -F ']' '{print $1}');
    yes | ufw delete $delrule
  fi
fi



echo "step 3"
# update the tracking file
if ! grep -q $ipaddr $trackingfile 
then 
  echo $ipaddr > $trackingfile
fi

echo "done"
# if rule is found, do nothing




