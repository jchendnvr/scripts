#!/bin/bash
# basic.sh
# 
# Author: Jesse Chenhalls
# Created Date: 20230731

# This script is meant to do universal basic configuration to an Ubuntu 20.04 LTS VM


# This command should be run as root 
if (($EUID == 0));
  then echo "Please do not run as root";
  exit;
fi
#echo "Running as root ... !"


# update everything
echo "Updating system"
sudo apt clean
sudo apt update -y && sudo apt upgrade -y
echo "
!!! Finished updating !!!
"

cat /etc/*release*; 
uname -a; 

echo "updating authorized ssh keys "
# allow ssh keys
if [ ! -d "$HOME/.ssh" ]
then
  mkdir $HOME/.ssh
fi
cat $HOME/scripts/ssh-keys >> $HOME/.ssh/authorized_keys
chmod 750 $HOME/.ssh
chmod 640 $HOME/.ssh/authorized_keys


echo "calling prompt to update prompt for user and root"
$HOME/scripts/prompt.sh
sudo $HOME/scripts/prompt.sh


echo "Complete"



#cp $HOME/scripts/vimrc $HOME/.vimrc
