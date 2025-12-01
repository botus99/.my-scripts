#!/usr/bin/env bash

set -e

# Check network connectivity
if ! ping -c 1 github.com &> /dev/null; then
    echo -e "\033[0;31mNo internet connection. \e[0mExiting."
    exit 1
fi

# Change directory to RetroArch shaders config
cd "$HOME"/.var/app/org.libretro.RetroArch/config/retroarch/shaders || exit 1

# Create Mega_Bezel_Packs directory if it doesn't exist
mkdir -p Mega_Bezel_Packs || exit 1

# Change directory to Mega_Bezel_Packs
cd Mega_Bezel_Packs || exit 1

# Clone or pull Duimon-Mega-Bezel repository
if [ ! -d "Duimon-Mega-Bezel" ]; then
    git clone https://github.com/Duimon/Duimon-Mega-Bezel
else
    cd "Duimon-Mega-Bezel"
    git pull
    cd ..
fi

# Check if all commands executed successfully
if [ $? -eq 0 ]; then
    echo "Duimon shaders are installed and up to date."
else
    echo "An error occurred during execution."
    exit 1
fi
