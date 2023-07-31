#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# utilities.sh

# a script to install different utilities I find helpful. 
# see Troubleshooting.md
echo "installing packages"
sudo apt -y install atop
sudo apt -y install bashtop
sudo apt -y install bat
sudo apt -y install bpytop
sudo apt -y install btop
sudo apt -y install calcurse
sudo apt -y install dstat
sudo apt -y install glances
sudo apt -y install htop
sudo apt -y install hwloc
sudo apt -y install ifstat
sudo apt -y install ioping
sudo apt -y install iotop
sudo apt -y install iperf3
sudo apt -y install jq
sudo apt -y install ncdu
sudo apt -y install net-tools
sudo apt -y install netdata
sudo apt -y install nethogs
sudo apt -y install nload
sudo apt -y install nmon
sudo apt -y install ranger
sudo apt -y install saidar
sudo apt -y install statgrab
sudo apt -y install sysstat
sudo apt -y install tldr


sudo snap install lsd
sudo snap install procs

echo "complete installing packages"

#lsd
if ! grep -q "alias ll='lsd -lah'" $HOME/.bashrc
then
  echo "
alias ll='lsd -lah'
" >> $HOME/.bashrc
fi

#ncdu dark
if ! grep -q "alias ncdu='ndcu --color dark'" $HOME/.bashrc
then
  echo "
alias ncdu='ndcu --color dark'
" >> $HOME/.bashrc
fi

# netdata
# disable from running by default
sudo systemctl disable netdata.service
# change the IP to listen on all 
sudo sed -i 's/bind socket to IP = 127.0.0.1/bind socket to IP = 0.0.0.0/g' /etc/netdata/netdata.conf


