#!/bin/bash

# Load configuration and theme
source ./ascii_clock.conf
source ./themes/theme_loader.sh


last_output=""

while true; do
    date_line=$(date +'%a %b %e %Y')       # All themes
    time_line="$(date +'%I:%M:%S %p')"     # retro

    if [[ "$time_line" != "$last_output" ]]; then
        clear

        if [[ "$USE_EMOJIS" == true ]]; then
            emoji=$(shuf -n1 assets/emojis.txt)
            echo -e "                   $emoji $emoji $emoji $emoji $emoji"
        fi

        echo -e "${COLOR}                   ${date_line}${RESET}"  # tecno
for i in {16..21} {21..16} ; do echo -en "\e[38;5;${i}m#####\e[0m" ; done ; echo
        echo "$time_line" | toilet -f "$FONT" --filter "$EFFECT" 
for i in {16..21} {21..16} ; do echo -en "\e[38;5;${i}m#####\e[0m" ; done ; echo


        last_output="$time_line"
    fi
    sleep 1
done
