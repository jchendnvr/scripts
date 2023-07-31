#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# prompt.sh

# 2023/5/15 
# updated with https://scriptim.github.io/bash-prompt-generator/

update_prompt () {
  echo "updating PS1 prompt for $USER"
  if ! grep -Fq 'PS1="\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;38;5;39m\]\W\[\e[0m\]:\[\e[0m\]#\[\e[0m\]> \[\e[0m\]"' $HOME/.bashrc
    then
      echo '

# light green user and short hostname followed by blue parent dir ( not full path)
PS1="\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;38;5;39m\]\W\[\e[0m\]:\[\e[0m\]#\[\e[0m\]> \[\e[0m\]"
' >> $HOME/.bashrc

      echo "updated user PS1"
    
    else echo ".bashrc already contains PS1"
  fi
}

#first call for user
# \u = user
# \h = short hostname
# \W = directory, not full path
# $ > = to end it
# PS1="\u@\h:\W:\$ > "

# \e[color1;color2m and color1 is optional
# 32 is green, 0 is white; 34 is blue

# You should enclose the prompt non printable color codes in \[ and \]
# So \e[32m becomes \[\e[32m\]


update_prompt
PS1="\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;38;5;39m\]\W\[\e[0m\]:\[\e[0m\]#\[\e[0m\]> \[\e[0m\]"

# old # PS1="\[\033[0;32m\]\u@\h\[\033[37m\]:\[\033[34m\]\W\[\033[37m\]:\$> "