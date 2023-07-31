#!/bin/bash
# Author: Jesse Chenhalls
# Created Date: 20230731
# document

echo "This will change your shell prompt to show 
USER:<username>-SYS:<hostname>-TIME:<time-and-date>-DIR:<directory> :>

Remember, you have to source it. 
. /document
"

PS1="USER:\u-SYS:\H-TIME:\d@\t-DIR:\w :>"
