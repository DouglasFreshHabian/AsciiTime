#!/bin/bash

# Default timezone
TIMEZONE="UTC"

# Check if an argument is passed for timezone
if [ ! -z "$1" ]; then
    TIMEZONE="$1"
fi

# Function to display the clock
display_clock() {
    while true; do
        clear
        echo -e "\033[1;32mCurrent Time in $TIMEZONE:\033[0m"
        echo -e "\033[1;34m$(TZ=$TIMEZONE date '+%Y-%m-%d %H:%M:%S')\033[0m"
        sleep 1
    done
}

# Start displaying the clock
display_clock
