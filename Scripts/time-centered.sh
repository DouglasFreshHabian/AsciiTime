#!/usr/bin/env bash

# Display Date + Time in Center of Terminal

clock() {
    local lastDim=("0" "0")
    local lines=()

    display_center() {
        local termDim=("$(tput lines)" "$(tput cols)")
        if [ "$((${termDim[0]} + ${termDim[1]}))" != "$((${lastDim[0]} + ${lastDim[1]}))" ]; then
            clear
            lastDim=(${termDim[@]})
        fi
        tput cup $((${termDim[0]} / 2 - $((${#lines[@]} / 2))))
        for ((i = 0; i < ${#lines[@]}; i++)); do
            printf '%*s\n' $(((${#lines[i]} + ${termDim[1]}) / 2)) "${lines[i]}"
            tput el
        done
    }

    local LOOPDELAY
    trap 'tput cnorm; trap - INT ERR' ERR
    trap 'tput cnorm; trap - INT ERR; return' INT
    tput civis
    while :; do
        lines=("$(date +%0H:%0M:%0S)")
        lines+=("$(date +"%A %B %-d %Y")")
        display_center
        LOOPDELAY=$(expr 1200000000 - $(command -p date '+%N'))
        LOOPDELAY=$(expr ${LOOPDELAY} / 100000000)
        sleep "$(expr ${LOOPDELAY} / 10).$(expr ${LOOPDELAY} % 10)"
    done
}
clock
