#!/usr/bin/env bash

set -euo pipefail
clear

# Set default values
BASE_URL="https://download.bazzite.gg"
OUTPUT_DIR="$PWD"

# Define color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to display Bazzite ISOs and get user input
show_menu() {
    echo -e "${BLUE}#=============================================================================#${NC}"
    echo -e "${CYAN}#              NOTE: Deck releases use KDE and Steam Gaming Mode.             #${NC}"
    echo -e "${CYAN}# Nvidia GTX releases do not support gaming mode and default to desktop mode. #${NC}"
    echo -e "${BLUE}#=============================================================================#${NC}"
    echo -e "Select your version of ${MAGENTA}Bazzite${NC}:"
    echo -e "${BLUE}- - - - - - - - - - - - - - - -${NC}"
    echo -e "1. Modern ${RED}AMD${NC} GPU Deck release"
    echo -e "2. Modern ${RED}AMD${NC} GPU Deck Live release"
    echo -e "3. ${GREEN}Nvidia${NC} RTX GPU Deck release"
    echo -e "4. ${GREEN}Nvidia${NC} RTX GPU Deck Live release"
    echo -e "5. ${GREEN}Nvidia${NC} GTX GPU release"
    echo -e "6. ${GREEN}Nvidia${NC} GTX GPU Live release"
    read -p "Enter your choice (1-6): " choice
}

# Show menu and get user input
show_menu

# Check user input
case $choice in
    1) RELEASE_TYPE="deck-stable";;
    2) RELEASE_TYPE="deck-stable-live";;
    3) RELEASE_TYPE="deck-nvidia-stable";;
    4) RELEASE_TYPE="deck-nvidia-stable-live";;
    5) RELEASE_TYPE="nvidia-stable";;
    6) RELEASE_TYPE="nvidia-stable-live";;
    *) echo "Your choice is invalid. Get out of here."; exit 1;;
esac

# Set filename based on release type
if [ "$RELEASE_TYPE" = "deck-stable" ]; then
    FILENAME="bazzite-deck-stable-amd64.iso"
elif [ "$RELEASE_TYPE" = "deck-stable-live" ]; then
    FILENAME="bazzite-deck-stable-live.iso"
elif [ "$RELEASE_TYPE" = "deck-nvidia-stable" ]; then
    FILENAME="bazzite-deck-nvidia-stable.iso"
elif [ "$RELEASE_TYPE" = "deck-nvidia-stable-live" ]; then
    FILENAME="bazzite-deck-nvidia-stable-live.iso"
elif [ "$RELEASE_TYPE" = "nvidia-stable-amd64" ]; then
    FILENAME="bazzite-nvidia-stable-amd64.iso"
elif [ "$RELEASE_TYPE" = "nvidia-stable-live" ]; then
    FILENAME="bazzite-nvidia-stable-live.iso"
else
    echo "Error setting filename based on release."
    exit 1
fi

# Check network connectivity
if ! ping -c 1 bazzite.gg &> /dev/null; then
    echo -e "\033[0;31mNo internet connection. \e[0mExiting."
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Function to download using aria2c or wget
download_iso() {
    local URL="${BASE_URL}/${FILENAME}"
    
    # Try aria2c first
    if command -v aria2c &>/dev/null && aria2c --max-connection-per-server=16 --split=16 --out="$OUTPUT_DIR/$FILENAME" "$URL"; then
        echo "Downloaded $FILENAME to $OUTPUT_DIR"
        return 0
    fi
    
    # If aria2c fails or not installed, use wget
    if wget --no-verbose --show-progress --progress=bar --output-document="$OUTPUT_DIR/$FILENAME" "$URL"; then
        echo "Downloaded $FILENAME to $OUTPUT_DIR"
        return 0
    else
        echo "Failed to download $FILENAME" >&2
        return 1
    fi
}

# Download latest ISO
download_iso
