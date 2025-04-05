#!/usr/bin/env bash

# Set default values
URL="https://cdimage.debian.org/cdimage/weekly-live-builds/amd64/iso-hybrid"
OUTPUT_DIR="$PWD"
FILENAME="debian-live-testing-amd64-${DESKTOP_ENV}.iso"

# Function to display menu and get user input
show_menu() {
    echo "Select a desktop environment:"
    echo "1. Cinnamon"
    echo "2. Gnome"
    echo "3. KDE Plasma"
    echo "4. LXDE"
    echo "5. LXQT"
    echo "6. Mate"
    echo "7. XFCE"
    echo "8. Standard (no desktop environment)"
    read -p "Enter your choice (1-8): " choice
}

# Show menu and get user input
show_menu

# Check user input
case $choice in
    1) DESKTOP_ENV="cinnamon";;
    2) DESKTOP_ENV="gnome";;
    3) DESKTOP_ENV="kde";;
    4) DESKTOP_ENV="lxde";;
    5) DESKTOP_ENV="lxqt";;
    6) DESKTOP_ENV="mate";;
    7) DESKTOP_ENV="xfce";;
    8) DESKTOP_ENV="standard";;
    *) echo "Your choice is invalid. Get out of here."; exit 1;;
esac

# Check network connectivity
if ! ping -c 1 debian.org &> /dev/null; then
    echo -e "\033[0;31mNo internet connection. \e[0mExiting."
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Download latest ISO
if wget --no-verbose --show-progress --progress=bar --output-document="$OUTPUT_DIR/$FILENAME" "${URL}/${FILENAME}"; then
    echo "Downloaded $FILENAME to $OUTPUT_DIR"
else
    echo "Failed to download $FILENAME" >&2
fi
