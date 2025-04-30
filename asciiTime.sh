#!/bin/bash

# Regular Colors
RED='\033[0;31m'       # Red
GREEN='\033[0;32m'     # Green
YELLOW='\033[0;33m'    # Yellow
BLUE='\033[0;34m'      # Blue
CYAN='\033[0;36m'      # Cyan
PURPLE='\033[0;35m'    # Purple
WHITE='\033[0;37m'     # White
RESET='\033[0m'        # Reset

# Bold Colors
REDB='\033[1;31m'      # Red
GREENB='\033[1;32m'    # Green
YELLOWB='\033[1;33m'   # Yellow
BLUEB='\033[1;34m'     # Blue
CYANB='\033[1;36m'     # Cyan
PURPLEB='\033[1;35m'   # Purple
WHITEB='\033[1;37m'    # White

# Source theme_loader.sh to load theme settings
source ./theme_loader.sh

# Check if the font is available
check_font() {
  if ! toilet -f "$1" "test" &>/dev/null; then
    echo -e "\e[1;31mFont '$1' not found, falling back to 'standard'.\e[0m"
    FONT="standard"
  fi
}

# Apply font check before running styles
check_font "$FONT"

#--------) Randomnly Choose Banner Color (--------#

# Array of color names
allcolors=("RED" "GREEN" "YELLOW" "BLUE" "CYAN" "PURPLE" "WHITE")

# Function to print banner with a random color
ascii_banner() {

    # Pick a random color from the allcolors array
    random_color="${allcolors[$((RANDOM % ${#allcolors[@]}))]}"

    # Convert the color name to the actual escape code
    case $random_color in
        "RED") color_code=$RED ;;
        "GREEN") color_code=$GREEN ;;
        "YELLOW") color_code=$YELLOW ;;
        "BLUE") color_code=$BLUE ;;
        "CYAN") color_code=$CYAN ;;
        "PURPLE") color_code=$PURPLE ;;
        "WHITE") color_code=$WHITE ;;
    esac

#--------) Display ASCII banner (--------#

   # Print the banner in the chosen color
    echo -e "${color_code}"
    cat << "EOF"
	     _.'_____`._
	   .'.-'  12 `-.`.
	  /,' 11      1 `.\
	 // 10      /   2 \\
	;;         /       ::
	|| 9  ----O      3 ||
	::                 ;;
	 \\ 8           4 //
	  \`. 7       5 ,'/
	   '.`-.__6__.-'.'
	    ((-._____.-))
	    _))       ((_
	   '--'       '--'
                _ _ _____ _                      
  __ _ ___  ___(_|_)__   (_)_ __ ___   ___   
 / _` / __|/ __| | | / /\/ | '_ ` _ \ / _ \  
| (_| \__ \ (__| | |/ /  | | | | | | |  __/
 \__,_|___/\___|_|_|\/   |_|_| |_| |_|\___
  github.com/DouglasFreshHabian/AsciiTime                                     
EOF
    echo -e "${RESET}"  # Reset color
}

# RETRO THEME
retro_style() {
  USE_EMOJIS=false
  SPACER="                  "
  last_output=""

  while true; do
      date_line=$(date +'%a %b %e %Y')  # All themes
      time_line="$(date +'%I:%M:%S %p')" # retro

      if [[ "$time_line" != "$last_output" ]]; then
          clear
          echo -e "${COLOR}                                ${date_line}${RESET}" 
          echo "$time_line" | toilet -f "$FONT" --filter "$EFFECT" | sed "s/^/${SPACER}/"
          last_output="$time_line"
      fi
      sleep 1
  done
}

# HACKER THEME
hacker_style() {
  USE_EMOJIS=true
  SPACER="                  "
  last_output=""

  while true; do
      date_line=$(date +'%a %b %e %Y')  # All themes
      time_line="$(date +'%I:%M:%S %p')" # retro

      if [[ "$time_line" != "$last_output" ]]; then
          clear
          if [[ "$USE_EMOJIS" == true ]]; then
              emoji=$(shuf -n1 ./emojis.txt)
              echo -e "                 $emoji $emoji $emoji $emoji"
          fi
          echo -e "${COLOR}                 ${date_line}${RESET}"
          echo "$time_line" | toilet -f "$FONT" --filter "$EFFECT" | sed "s/^/${SPACER}/"
          if [[ "$USE_EMOJIS" == true ]]; then
              echo -e "                 $emoji $emoji $emoji $emoji"
          fi
          last_output="$time_line"
      fi
      sleep 1
  done
}

# TECHNO THEME
techno_style() {
  USE_EMOJIS=true
  SPACER="                  "
  last_output=""

  while true; do
      date_line=$(date +'%a %b %e %Y')  # All themes
      time_line="$(date +'%I:%M:%S %p')" # retro

      if [[ "$time_line" != "$last_output" ]]; then
          clear
          if [[ "$USE_EMOJIS" == true ]]; then
              emoji=$(shuf -n1 ./emojis.txt)
              echo -e "                   $emoji $emoji $emoji $emoji"
          fi
          echo -e "${COLOR}                   ${date_line}${RESET}"
          for i in {16..21} {21..16}; do echo -n -e "\e[38;5;${i}m#####\e[0m"; done; echo
          echo "$time_line" | toilet -f "$FONT" --filter "$EFFECT"
          for i in {16..21} {21..16}; do echo -en "\e[38;5;${i}m#####\e[0m"; done; echo
          last_output="$time_line"
      fi
      sleep 1
  done
}

# HELP MENU
help_menu() {

ascii_banner

  echo -e "\e[1;34mUsage\e[0m: \e[1;36m./asciiTime.sh\e[0m \e[1;33m[OPTION]\e[0m"
  echo -e "\e[0;31m\nOptions:\e[0m"
  echo -e "\e[1;37m\t--help\t        Show this help menu."
  echo -e "\e[1;37m\t--hacker\t${GREEN}Green, terminal-style theme with border."
  echo -e "\e[1;37m\t--retro\t        ${PURPLE}Vintage inspired theme with Purple & Metallic."
  echo -e "\e[1;37m\t--techno\t${CYAN}Futuristic theme with Cyan, metallic font & Big font.${RESET}"
  echo -e "\e[1;37m\t--list\t        ${WHITE}List all available \e[40;38;5;82mThemes${RESET}."
  echo -e "\e[1;37m\t--ascii\t        ${WHITE}Display \e[38;5;82mAscii \e[38;5;198mArt.${RESET}"
  exit 0
}

# Parse command-line options
while [[ $# -gt 0 ]]; do
  case "$1" in
    --hacker)
      THEME="hacker"
      source ./theme_loader.sh  # Load theme settings
      check_font "$FONT"
      hacker_style
      shift
      ;;
    --retro)
      THEME="retro"
      source ./theme_loader.sh  # Load theme settings
      check_font "$FONT"
      retro_style
      shift
      ;;
    --techno)
      THEME="techno"
      source ./theme_loader.sh  # Load theme settings
      check_font "$FONT"
      techno_style
      shift
      ;;
    --list)
      echo -e "${WHITEB}Available themes${RESET}: ${GREENB}hacker${RESET}, ${PURPLEB}retro${RESET} & ${CYANB}techno${RESET}."
      shift
      ;;
    --help)
      help_menu
      shift
      ;;
    --ascii)
      ascii_banner
      shift
      ;;
    *)
      echo -e "\e[1;31mInvalid option: $1\e[0m"
      exit 1
      ;;
  esac
done
