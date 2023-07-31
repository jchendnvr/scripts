#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# regenerate_ssh.sh

# This script will regenerate the SSH Keys

if [ "$1" == '-h' ] || [ "$1" == '?' ] || [ "$1" == '--help' ]
then
  echo "This script will regenerate ssh keys for the user 
  or if all argument is passed to it, then for the system and root users.
"
fi

#
# root and system
#
if [ "$1" == 'all' ]
then
  # check if this command should be run as root
  if (($EUID != 0));
    then echo "all requires running as root";
  exit;
  fi
  echo "Running as root ... !"	
  
  echo "regenerating root and system keys
  rm -f /etc/ssh/*key*
  rm -f $HOME/.ssh/*
  ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa -b 4096
  ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa -b 4096
  ssh-keygen -f /root/.ssh/id_rsa -N '' -t rsa -b 4096
  "
  rm -f /etc/ssh/*key*
  rm -f $HOME/.ssh/id_rsa*
  ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa -b 4096
  ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa -b 4096
  ssh-keygen -f /root/.ssh/id_rsa -N '' -t rsa -b 4096
  echo "complete"
  exit
fi

#
# user 
#
if [ -z "$1" ] 
then 
  echo "Regenerate ssh keys for current user. 
!!!! RUN FOR EACH USER !!!!
rm -f $HOME/.ssh/*
ssh-keygen -f $HOME/.ssh/id_rsa -N '' -t rsa -b 4096
"
  # Regenerate ssh keys
  rm -f $HOME/.ssh/id_rsa*
  ssh-keygen -f $HOME/.ssh/id_rsa -N '' -t rsa -b 4096
  echo "complete"
  exit
else 
  echo "You passed an invalid argument, see -h or --help"
  sleep 1
  exit
fi
