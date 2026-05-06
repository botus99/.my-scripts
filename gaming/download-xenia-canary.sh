#!/usr/bin/env bash

# exit if anything fails
set -euo pipefail

# set directory for Xenia variable
XENIADIR="$HOME/xenia-canary"

# check network connectivity
if ! ping -c 1 github.com &> /dev/null; then
    echo -e "\033[0;31mNo internet connection. \e[0mExiting."
    exit 1
fi

# make sure Xenia directory exists
mkdir -p "$XENIADIR"

# download latest Xenia release (linux)
#wget -q --show-progress --progress=bar -c "https://github.com/xenia-canary/xenia-canary/releases/download/latest/xenia_canary_linux.AppImage"

# download latest Xenia release (windows)
wget -q --show-progress --progress=bar -c "https://github.com/xenia-canary/xenia-canary-releases/releases/latest/download/xenia_canary_windows.zip"

# check if download was successful
if [ $? -eq 0 ]; then
    echo "Xenia Canary Windows release successfully downloaded."
else
    echo "Failed to download Xenia Canary Windows release."
    rm xenia_canary_windows.zip
    exit 1
fi

# unzip downloaded file
unzip xenia_canary_windows.zip -d "$XENIADIR"

# clean up
rm xenia_canary_windows.zip

echo "Xenia Canary download and extraction completed successfully!"
