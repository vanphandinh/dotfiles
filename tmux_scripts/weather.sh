#!/bin/bash

if [ "$1" == "off" ]; then
    echo ""
else
    CITY=$(echo $1 | sed -e "s/ /%20/g")
    echo $(curl -s wttr.in/$CITY\?format\="%l:+%c%20%t%20%w&period=5")
fi
