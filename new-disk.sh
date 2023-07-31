#!/bin/bash
# new-disk.sh
# Author: Jesse Chenhalls
# Created Date: 20230731

# This will add a new disk to your system. 
# it checks you are running it as root, aka sudo new-disk.sh


# This command should be run as root
if (($EUID != 0));
  then echo "Please run as root";
  exit;
fi
echo "Running as root ... !"

echo ""

echo "This script will add a new disk to a new LVM"

# First run partprobe to detect changes
partprobe
sleep 2
echo "Displaying disks"
echo "SCSI DISKS"
ls /dev/sd*
echo ""
echo "Displaying NVME disks"
ls /dev/nvme*
sleep 2
echo ""
echo "SCSI disks follow format sdX and partitions are a number.
eg: sdb1 and sdb2
If you see a new disk drive, sdX with no number, that is your new disk you will enter.

NVME drives follow a /dev/nvme0n1 where controller 0 and drive 1 is indicated.
NVME drives with existing partitions will have a p number at the end such as 
nvme0n1p1. If you see a nvmeXnY drive with no p number, this is your new disk you will
enter. 
"
sleep 2

DRIVE=""
# Get drive from user. 
echo "Please type the name of the new drive, eg: 'sdb' or 'nvme0n2' without the quotes."
read DRIVE

# check drive exists. 
if [ ! -b /dev/$DRIVE ] ; 
then 
  echo "!!! Drive doesn't exist, please correct and run again. !!!"; 
  exit;
fi

# check for existing partition on SCSI drives.
if ( echo $DRIVE | grep -q 'sd' );
then
  PART1=${DRIVE}1
  echo $PART1
  if [[ -b /dev/$PART1 ]];
  then
    echo "Partition already exists on $DRIVE. We are unable to continue.";
    echo "You will want to perform additional partitions manually";
    exit;
  fi
fi

# Check for existing partition on NVME drives
if ( echo $DRIVE | grep -q 'nvm' );
then
  PART1=${DRIVE}p1
  echo $PART1
  if [[ -b /dev/$PART1 ]];
  then
    echo "Partition already exists on $DRIVE. We are unable to continue.";
    echo "You will want to perform additional partitions manually";
    exit;
  fi
fi

echo "Reached bottom"



