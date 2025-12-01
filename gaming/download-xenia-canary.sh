#!/usr/bin/env bash

# Exit if anything fails
set -euo pipefail

# Set directory for Xenia variable
XENIADIR="$HOME/xenia-canary"

# Check network connectivity
if ! ping -c 1 github.com &> /dev/null; then
    echo -e "\033[0;31mNo internet connection. \e[0mExiting."
    exit 1
fi

# Make sure Xenia directory exists
mkdir "$XENIADIR"

# Download the latest Xenia release (Windows)
wget -q --show-progress --progress=bar -c "https://github.com/xenia-canary/xenia-canary-releases/releases/latest/download/xenia_canary_windows.zip"

# Download the latest Xenia release (Linux)
#wget -q --show-progress --progress=bar -c "https://github.com/xenia-canary/xenia-canary-releases/releases/latest/download/xenia_canary_linux.tar.gz"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Xenia Canary Windows release successfully downloaded."
else
    echo "Failed to download Xenia Canary Windows release."
    rm xenia_canary_windows.zip
    exit 1
fi

# Unzip the downloaded file
unzip xenia_canary_windows.zip -d "$XENIADIR"

# Clean up
rm xenia_canary_windows.zip

echo "Xenia Canary download and extraction completed successfully!"
