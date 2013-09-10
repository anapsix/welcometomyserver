#!/bin/bash
# welcome to the server

QOTD_ENABLED=true   # Quote of the Day true/false
MINIMUM_UID=1000

# API Docs: http://iheartquotes.com/api
if $QOTD_ENABLED && [ "$(id -u)" -ge ${MINIMUM_UID} ]; then
	max_chars=80
	qotd=$(timeout 1 curl -s "http://www.iheartquotes.com/api/v1/random?max_lines=1&max_characters=${max_chars:-80}&show_permalink=false&show_source=false")
	if [ $? -eq 0 ]; then
		/bin/echo -e "\e[0;49;90mWOTD: ${qotd}\e[0m" | sed 's/\&quot;/"/g'
	fi
fi

# reset colors
tput sgr0

# EOF
