#!/bin/bash

# Load configuration and theme
source ./ascii_clock.conf
source ./themes/theme_loader.sh

# Number of spaces to shift the boxed time
SPACER="                  "  # adjust as needed

last_output=""

while true; do
    date_line=$(date +'%a %b %e %Y')       # All themes
    time_line="$(date +'%I:%M:%S %p')"     # retro

    if [[ "$time_line" != "$last_output" ]]; then
        clear

        if [[ "$USE_EMOJIS" == true ]]; then
            emoji=$(shuf -n1 assets/emojis.txt)
            echo -e "                 $emoji $emoji $emoji $emoji $emoji"
        fi

        echo -e "${COLOR}                 ${date_line}${RESET}"  # tecno
        echo "$time_line" | toilet -f "$FONT" --filter "$EFFECT" | sed "s/^/${SPACER}/"         # hacker

        if [[ "$USE_EMOJIS" == true ]]; then
            echo -e "                 $emoji $emoji $emoji $emoji $emoji"
        fi

        last_output="$time_line"
    fi
    sleep 1
done
