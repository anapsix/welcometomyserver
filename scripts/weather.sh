#!/bin/bash

WEATHER_ENABLED=true # Weather true/false
COUNTRY="USA"
ZIP="01581"

if $WEATHER_ENABLED; then
	LOCATION_CODE="${COUNTRY}|${ZIP}"
	#OPTIONS="metric=1"
	response=$(timeout 0.3 curl -s "http://rss.accuweather.com/rss/liveweather_rss.asp?locCode=${LOCATION_CODE}&${OPTIONS}")
	if [ $? -eq 0 ]; then
		weather=$(echo ${response} | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p')
		echo -ne "\e[0;49;90m"
		echo "Weather: ${weather}"
	fi
fi

# reset colors
tput sgr0

# EOF
