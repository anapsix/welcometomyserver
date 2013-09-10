#!/bin/bash
# welcome to the server

BOXES_ENABLED=true  # BOXES welcome true/false
MINIMUM_UID=1000

if $BOXES_ENABLED && [ -x /usr/bin/boxes ] && [ "$(id -u)" -ge ${MINIMUM_UID} ]; then
	style=( parchment columns whirly nuke diamonds mouse sunset boy girl nuke netdata xes dog cat capgirl santa spring stark2 stark1 peek )
	_username=$(getent passwd | grep ":$(id -u):" | cut -d: -f5 | tr -d ",")
	echo -ne "\e[0;49;90m"
	echo "Welcome ${_username:-$(whoami)}!" | boxes -d ${style[RANDOM%20]}
	tput sgr0
fi

# reset colors
tput sgr0

# EOF
