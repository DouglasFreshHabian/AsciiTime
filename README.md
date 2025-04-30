[![License](https://img.shields.io/github/license/DouglasFreshHabian/AsciiTime?style=flat-square)](LICENSE)
[![Stars](https://img.shields.io/github/stars/DouglasFreshHabian/AsciiTime?style=flat-square)](https://github.com/DouglasFreshHabian/AsciiTime/stargazers)
[![Issues](https://img.shields.io/github/issues/DouglasFreshHabian/AsciiTime?style=flat-square)](https://github.com/DouglasFreshHabian/AsciiTime/issues)
[![Shellcheck Passed](https://img.shields.io/badge/style-shell--script-green?style=flat-square)](https://www.shellcheck.net/)
[![License](https://img.shields.io/github/license/DouglasFreshHabian/AsciiTime?style=flat-square)](LICENSE)
[![Bash](https://img.shields.io/badge/bash-%23121011.svg?style=flat-square&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)

[![asciicast](https://asciinema.org/a/717581.svg)](https://asciinema.org/a/717581?t=0:05)

# ⏰ ASCII Time
`asciiTime.sh` is a customizable Bash script that displays the current time in a variety of ASCII art styles, with unique themes such as Hacker, Retro, and Techno, giving your terminal a vibrant and creative look.

> A modular, emoji-powered ASCII art clock for your terminal.  
> Animated. Themed. Hackable. Made with 💥 by Bash.

## 🧮 Features 

- Animated emoji frames
- Modular themes (hacker, retro, techno)
- Easily customizable via `theme_loader.conf`
- ASCII fonts via `toilet`
---

## 🆘 Requirements

```bash
sudo apt install toilet figlet lolcat -y
```

## 🌀 Getting Started

Make Script Exectuable:
```bash
chmod +x asciiTime.sh
```

Run Script:
```bash
./asciiTime.sh --help
```

## 🕹️  Usage

🌈 Choose from three unique themes to display the current time in your terminal.

List the available themes:
```bash
./asciiTime.sh --list
```

🎮 Retro
💻 Hacker
🚀 Techno

Use --hacker, --retro, or --techno to switch between them. 🖥️"

Run the hacker time theme:
```bash
./asciiTime.sh --hacker
```
---

## 🎨 Themes

* hacker: green + border
* retro: magenta + metal
* techno: cyan + big font

### 🖥️   Hacker Theme:

**Hacker Mode**: A sleek, minimalistic design featuring a terminal-inspired font and border effect. Perfect for anyone who loves a high-tech, cyberpunk vibe. 💻🖤

### 📼  Retro Theme:

**Retro Mode**: A nostalgic throwback to old-school computer screens with a vintage font and colorful effects. It’s ideal for lovers of retro computing and classic gaming. 🎮📼

## 🎧 Techno Theme:

**Techno Mode**: A dynamic and futuristic theme that displays the time with vibrant colors and digital effects, perfect for those who want a bold and energetic look in their terminal. 🚀🌈

---

## Summary of Theme-Specifi Behavior

| Theme   | Emojis | Boxed Time | Centering (Manual) | RGB Bars | PM Placement |
|---------|--------|------------|---------------------|----------|--------------|
| Hacker  | ✅     | ✅          | `SPACER`            | ❌       | On same line |
| Retro   | ❌     | ❌ (plain)  | Heavy right shift   | ❌       | On same line |
| Techno  | ✅     | ❌         | Default toilet centering | ✅   | On same line |

## 🧠 asciiTime.sh – Main Script

The script loads the `emojis.txt` & `theme_loader.sh` files
```bash
#!/bin/bash

# Load configuration and theme
source ./theme_loader.conf
```
---

## 🎨 `theme_loader.sh` – Theme Logic

File which stores various themes:

```bash
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
```
> Note: You can create and add additional themes to this file
---

## 📦 emojis.txt – Emoji Pool (1 per line)

Emojis - One per line:
```bash
🕶️
💾
⚙️
🐧
🚀
🧠
🛸
💻
🧬
```
## ✍️ Author

| Name:             | Description                                       |
| :---------------- | :------------------------------------------------ |
| Script:           | asciiTime.sh                                      |
| Author:           | Douglas Habian                                    |
| Version:          | 1.1                                               |
| Repo:             | https://github.com/DouglasFreshHabian/AsciiTime   |


## 💖 Support This Project

If AsciiTime™ has helped you or your system, consider supporting the project!  
Your contributions help fuel future updates, testing, and new features.

☕ [Buy Me a Coffee](https://www.buymeacoffee.com/douglashabian)  
🔗 [Ko-fi](https://ko-fi.com/douglashabian)  
🎁 [Sponsor on GitHub](https://github.com/sponsors/DouglasFreshHabian)

Every bit of support is appreciated — thank you!

### If you have not done so already, please head over to the channel and hit that subscribe button to show some support. Thank you!!!

## 👍 [Stay Fresh](https://www.youtube.com/@DouglasHabian-tq5ck) 

<!-- Reach out to me if you are interested in collaboration or want to contract with me for any of the following:
        Building Github Pages
        Creating Youtube Videos
        Editing Youtube Videos
        Youtube Thumbnail Creation
        Anything Pertaining to Linux! -->

<!-- 
 _____              _       _____                        _          
|  ___| __ ___  ___| |__   |  ___|__  _ __ ___ _ __  ___(_) ___ ___ 
| |_ | '__/ _ \/ __| '_ \  | |_ / _ \| '__/ _ \ '_ \/ __| |/ __/ __|
|  _|| | |  __/\__ \ | | | |  _| (_) | | |  __/ | | \__ \ | (__\__ \
|_|  |_|  \___||___/_| |_| |_|  \___/|_|  \___|_| |_|___/_|\___|___/
        dfresh@tutanota.com Fresh Forensics, LLC 2025 -->
