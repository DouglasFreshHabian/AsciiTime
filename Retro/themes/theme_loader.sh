#!/bin/bash

# Default to techno if undefined
#THEME=${THEME:-techno}

case "$THEME" in
  hacker)
    COLOR='\033[0;32m'
    FONT="term"
    EFFECT="border"
    ;;
  retro)
    COLOR='\033[1;35m'
    FONT="smmono9"
    EFFECT="metal"
    ;;
  techno)
    COLOR='\033[1;36m'
    FONT="big"
    EFFECT="metal"
    ;;
  *)
    COLOR='\033[0m'
    FONT="standard"
    EFFECT=""
    ;;
esac

RESET='\033[0m'
