# Scripts for use on Ubuntu machine

## Useful for VMware workstation Linux machines

## Description of scripts and their use. 
- basic.sh = Run on a new machine. 
  - Updates packages, configures ssh/authorized_keys, and configures the prompt
- byobu.sh = configures byobu the tmux wrapper
- clone-prep.sh = useful for preparing an Ubuntu VM for cloning on VMware workstation
- dhcp.sh = changes machine network to DHCP
- document.sh = Modifies the prompt so it shows username-hostname-timestamp-directory
- ip-firewall.sh = A utility to allow dynamic DNS domains access through firewall
- kill_ipv6.sh = kills IPv6 
- new-disk.sh = helps add a new disk in OS after adding it via VM settings.
- new-user.sh = Some default settings for new users. 
- prompt.sh = Settings for terminal prompt, called by basic.sh as well. 
- regenerate_ssh.sh = Run as root and then run again as regular user
- resize.sh = disk utility to add more space in OS after extending disk in VM settings 
- ssl-cert.sh = Creates SSL certs and CSR. Need to modify for Ubuntu and might be broken currently. 
- utilities.sh = Installs a lot of utilities useful for troubleshooting
- vim-packages.txt = list of VIM packages I found useful
- vim.readme = explains how settings per .vimrc work
- vimme.sh = sets .vimrc and installs plugins
- vimrc = used by vimme.sh 
- Trouble-Shooting.md provides some guidance on this. 


## New machines for templates
- Create VM, install OS. 
- Run basic.sh, utilities.sh, and vimme.sh
- Run dhcp.sh
- clone-prep.sh
- shutdown
- Clone and power on clone VM
- regenerate_SSH.sh if needed
- static.sh if needed




