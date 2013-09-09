#!/bin/bash
# welcome to the server

BOXES_ENABLED=false # BOXES welcome true/false
QOTD_ENABLED=true   # Quote of the Day true/false

if $BOXES_ENABLED && [ -x /usr/bin/boxes ] && [ "$(id -u)" -gt 5000 ]; then
	style=( parchment columns whirly nuke diamonds mouse sunset boy girl nuke netdata xes dog cat capgirl santa spring stark2 stark1 peek )
	_username=$(getent passwd | grep ":$(id -u):" | cut -d: -f5)
	echo -ne "\e[0;49;90m"
	echo "Welcome ${_username}!" | boxes -d ${style[RANDOM%20]}
	tput sgr0
fi


# API Docs: http://iheartquotes.com/api
if $QOTD_ENABLED && [ "$(id -u)" -gt 5000 ]; then
	max_chars=80
	qotd=$(timeout 1 curl -s "http://www.iheartquotes.com/api/v1/random?max_lines=1&max_characters=${max_chars:-80}&show_permalink=false&show_source=false")
	if [ $? -eq 0 ]; then
		/bin/echo -e "\e[0;49;90mWOTD: ${qotd}\e[0m" | sed 's/\&quot;/"/g'
	fi
fi

# reset colors
tput sgr0


# EOF
