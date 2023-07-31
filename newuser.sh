#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# newuser.sh


# 2022/1/19

echo "creating new user"
if [ -z $1 ]
then 
  echo "What do you want username to be? "
  read USERNAME
else
  USERNAME=$1
fi

echo "Requires sudo to create user"
sudo useradd -m -s /bin/bash $USERNAME

if [ -z $2 ]
then 
  echo "Please enter password for user:"
  read -s PASSWORD
else
  PASSWORD=$2
fi

echo "Requires sudo to set passwd"
echo "$USERNAME:$PASSWORD" | sudo chpasswd 

echo "Create user $USERNAME account complete"
echo "Generating ssh keys for user"
sudo su -l -c "ssh-keygen -f /home/$USERNAME/.ssh/id_rsa -N '' -t rsa -b 4096" $USERNAME
sleep 1
echo "Complete"

