#!/bin/bash

echo $(curl -s wttr.in/\?format\="%l:+%c%20%t%20%w&period=5")
