#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# byobu.sh

# we could add the following to .profile to have it start automatically. 
#_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
#
# currently there is an issue where clipboard wont passthru though so do not want to 
# start automatically


# change the bind key from ctrl+a to ctrl+q

echo "customizing byobu"

# check if byobu run before
if [ ! -d "$HOME/.byobu" ]
then
  echo "Please run byobu once before running this script."
  sleep 2
  exit
fi


# check if already modified files. 
if ! grep -Fq 'set -g mouse on' $HOME/.byobu/.tmux.conf
then 
  echo "set -g mouse on" >> $HOME/.byobu/.tmux.conf
  echo "Changing the bind key from ctrl+a to ctrl+q so it will work in nested VM"
  echo "unbind-key -n C-q
set -g prefix ^Q
bind q send-previx
  " >> $HOME/.byobu/keybindings.tmux
else
  echo "Already set customizations"
  sleep 1
fi
