#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# resize.sh

# This script will resize the lvm to the available space.
# 
# The purpose of this script is for initial VMware VMs that were made to a specific 
# size template. Now each additional VM will either be that size or larger.
#

# This command should be run as root
if (($EUID != 0));
  then echo "Please run as root";
  exit;
fi
echo "Running as root ... !"

echo "This script will either create a new partition and added it to the existing LVM"
echo "or it will resize the existing space to the maximum it can be."
echo "If you increased space on existing template, you should choose yes"
echo "Saying no is for FRESH install new templates you are creating."
echo ""
echo "Should I create a new partition?"
echo "!!! Note, this assumes /dev/sda3 already exists and will create /dev/sda4 !!!"
echo "!!! it also assumes your VirtualGroup is called ubuntu-vg with an ubuntu-lv"
echo "y/n, default n"
read ANS1
if [ "$ANS1" == 'Y' ] || [ "$ANS1" == 'y' ]
then
  echo "Creating new partiton"
  echo 1 > /sys/block/sda/device/rescan
  sleep 4
  # below lines formating required till EOF
  fdisk /dev/sda <<EOF
n



w
EOF
  sleep 2
  partprobe
  sleep 2
  ls /dev/sda*
  sleep 2
  pvcreate /dev/sda4
  pvdisplay 
  sleep 2
  vgextend ubuntu-vg /dev/sda4
  vgdisplay 
  sleep 2
  lvextend -l +100%Free /dev/ubuntu-vg/ubuntu-lv
  lvdisplay
  sleep 2
  resize2fs /dev/ubuntu-vg/ubuntu-lv
  lvdisplay 
  sleep 2
  df -h 
  sleep 2
  echo "complete"
else
  echo "  lvresize -l +100%Free /dev/ubuntu-vg/ubuntu-lv
  resize2fs /dev/ubuntu-vg/ubuntu-lv 
  !!! Please reboot to take full effect !!!"
  lvresize -l +100%Free /dev/ubuntu-vg/ubuntu-lv
  resize2fs /dev/ubuntu-vg/ubuntu-lv
  echo "complete"
fi


