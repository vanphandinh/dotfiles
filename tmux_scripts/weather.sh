#!/bin/bash
#
# Weather
# =======
#
# By Jezen Thomas <jezen@jezenthomas.com>
#
# This script sends a couple of requests over the network to retrieve
# approximate location data, and the current weather for that location. This is
# useful if for example you want to display the current weather in your tmux
# status bar.

# There are three things you will need to do before using this script.
#
# 1. Install jq with your package manager of choice (homebrew, apt-get, etc.)
# 2. Sign up for a free account with OpenWeatherMap to grab your API key
# 3. Add your OpenWeatherMap API key where it says API_KEY

# OPENWEATHERMAP API KEY (place yours here)
API_KEY="65ff375e8ef9ad09ba502645524b9132"

set -e

# Not all icons for weather symbols have been added yet. If the weather
# category is not matched in this case statement, the command output will
# include the category ID. You can add the appropriate emoji as you go along.
#
# Weather data reference: http://openweathermap.org/weather-conditions
weather_icon() {
    if [ $1 -ge 200 -a $1 -lt 300 ]; then
        if [ $1 -eq 210 -o $1 -eq 211 -o $1 -eq 212 -o $1 -eq 221 ]; then
            echo 🌩️
        else
            echo ⛈️
        fi
    elif [ $1 -ge 300 -a $1 -lt 400 ]; then
        echo 🌦️
    elif [ $1 -ge 500 -a $1 -lt 600 ]; then
        if [ $1 -eq 511 ]; then
            echo 🌨️
        else
            echo 🌧️
        fi
    elif [ $1 -ge 600 -a $1 -lt 700 ]; then
        echo 🌨️
    elif [ $1 -ge 700 -a $1 -lt 800 ]; then
        if [ $1 -eq 762 ]; then
            echo 🌋
        elif [ $1 -eq 781 ]; then
            echo 🌪️
        else
            echo 🌫️
        fi
    elif [ $1 -ge 800 -a $1 -lt 900 ]; then
        if [ $1 -eq 800 ]; then
            echo ☀️
        elif [ $1 -eq 801 ]; then
            echo ⛅
        elif [ $1 -eq 802 ]; then
            echo 🌥️
        elif [ $1 -eq 803 -o $1 -eq 804 ]; then
            echo ☁️
        else 
            echo 🌤️
        fi
    fi
}

LOCATION=$(curl --silent https://extreme-ip-lookup.com/json)
CITY=$(echo "$LOCATION" | jq -r .city)
LAT=$(echo "$LOCATION" | jq -r .lat)
LON=$(echo "$LOCATION" | jq -r .lon)

WEATHER=$(curl --silent http://api.openweathermap.org/data/2.5/weather\?lat="$LAT"\&lon="$LON"\&APPID="$API_KEY"\&units=metric)

CATEGORY=$(echo "$WEATHER" | jq .weather[0].id)
TEMP="$(echo "$WEATHER" | jq .main.temp | cut -d . -f 1)°C"
WIND_SPEED="$(echo "$WEATHER" | jq .wind.speed | awk '{print int($1+0.5)}')ms"
ICON=$(weather_icon "$CATEGORY")

printf "%s" "$CITY:$ICON $TEMP, $WIND_SPEED"
