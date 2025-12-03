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
    echo -e "${CYAN}#               NOTE: Deck releases use KDE & Steam Gaming Mode.              #${NC}"
    echo -e "${CYAN}#     Old GPUs do not support Steam Gaming Mode & default to desktop mode.    #${NC}"
    echo -e "${BLUE}#=============================================================================#${NC}"
    echo -e "Select your version of ${MAGENTA}Bazzite${NC}:"
    echo -e "${YELLOW}- - - - - - - - - - - - - - - - - -${NC}"
    echo -e "1. New ${RED}AMD${NC} or ${BLUE}Intel${NC} GPU Deck"
    echo -e "2. New ${RED}AMD${NC} or ${BLUE}Intel${NC} GPU Deck [${CYAN}Live${NC}]"
    echo -e "3. Old ${RED}AMD${NC} or ${BLUE}Intel${NC} GPU"
    echo -e "4. Old ${RED}AMD${NC} or ${BLUE}Intel${NC} GPU [${CYAN}Live${NC}]"
    echo -e "5. New ${GREEN}Nvidia${NC} RTX GPU Deck"
    echo -e "6. New ${GREEN}Nvidia${NC} RTX GPU Deck [${CYAN}Live${NC}]"
    echo -e "7. Old ${GREEN}Nvidia${NC} GTX GPU"
    echo -e "8. Old ${GREEN}Nvidia${NC} GTX GPU [${CYAN}Live${NC}]"
    echo -e "${YELLOW}- - - - - - - - - - - - - - - - - -${NC}"
    read -p "Enter your choice (1-8): " choice
}

# Show menu and get user input
show_menu

# Check user input
case $choice in
    1) RELEASE_TYPE="deck-stable";;
    2) RELEASE_TYPE="deck-stable-live";;
    3) RELEASE_TYPE="stable";;
    4) RELEASE_TYPE="stable-live";;
    5) RELEASE_TYPE="nvidia-open-stable";;
    6) RELEASE_TYPE="nvidia-open-stable-live";;
    7) RELEASE_TYPE="nvidia-stable";;
    8) RELEASE_TYPE="nvidia-stable-live";;
    *) echo "Your choice is invalid. Get out of here."; exit 1;;
esac

# Set filename based on release type
if [ "$RELEASE_TYPE" = "deck-stable" ]; then
    FILENAME="bazzite-deck-stable-amd64.iso"
elif [ "$RELEASE_TYPE" = "deck-stable-live" ]; then
    FILENAME="bazzite-deck-stable-live.iso"
elif [ "$RELEASE_TYPE" = "stable" ]; then
    FILENAME="bazzite-stable-amd64.iso"
elif [ "$RELEASE_TYPE" = "stable-live" ]; then
    FILENAME="bazzite-stable-live.iso"
elif [ "$RELEASE_TYPE" = "nvidia-open-stable" ]; then
    FILENAME="bazzite-nvidia-open-stable-amd64.iso"
elif [ "$RELEASE_TYPE" = "nvidia-open-stable-live" ]; then
    FILENAME="bazzite-nvidia-open-stable-live.iso"
elif [ "$RELEASE_TYPE" = "nvidia-stable" ]; then
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
        exit 0
    fi
    
    # If aria2c fails or not installed, use wget
    if wget --no-verbose --show-progress --progress=bar --output-document="$OUTPUT_DIR/$FILENAME" "$URL"; then
        echo "Downloaded $FILENAME to $OUTPUT_DIR"
        exit 0
    else
        echo "Failed to download $FILENAME" >&2
        return 1
    fi
}

# Download latest ISO
download_iso
