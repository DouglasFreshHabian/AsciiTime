#!/bin/bash

# Emoji array for animation
emojis=(🕐 🕑 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚 🕛)

# Colors (for fallback if lolcat isn't used)
CYAN='\033[1;36m'
RESET='\033[0m'

last_output=""

while true; do
    date_line=$(date +'%a %b %e %Y')
    time_line=$(date +'%I:%M:%S %p')

    # Avoid duplicate output
    if [[ "$time_line" != "$last_output" ]]; then
        clear

        # Emoji animation (cycling)
        emoji=${emojis[$((RANDOM % ${#emojis[@]}))]}

        # Print date
        echo -e "${CYAN}$date_line${RESET}"
        echo -e "$emoji  $emoji  $emoji  $emoji  $emoji"

        # Print ASCII art time
        echo "$time_line" | figlet | lolcat
        echo -e "$emoji  $emoji  $emoji  $emoji  $emoji"

        last_output="$time_line"
    fi

    sleep 1
done
