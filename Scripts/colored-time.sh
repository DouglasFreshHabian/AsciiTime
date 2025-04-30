#!/bin/bash

# Define ANSI color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
RESET='\033[0m'

last_output=""

while true; do
    current_output=$(date +'%a %b %e %Y%n%I:%M %p')

    # Only print if the time has changed
    if [[ "$current_output" != "$last_output" ]]; then
        clear  # Optional: clears the screen for a cleaner display

        # Split and colorize the output
        date_line=$(echo "$current_output" | head -n1)
        time_line=$(echo "$current_output" | tail -n1)

        echo -e "${CYAN}${date_line}${RESET}"
        echo -e "${MAGENTA}${time_line}${RESET}"

        last_output="$current_output"
    fi

    sleep 1
done
