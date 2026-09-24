#!/usr/bin/env bash

# exit if anything fails
set -euo pipefail

# set directory for Xenia variable
XENIADIR="$PWD/xenia-canary"

# check network connectivity
if ! ping -c 1 github.com &> /dev/null; then
    echo -e "\033[0;31mNo internet connection. \e[0mExiting."
    exit 1
fi

# make sure Xenia directory exists
mkdir -p "$XENIADIR"

# download latest Xenia release (linux)
#wget -q --show-progress --progress=bar -c "https://github.com/xenia-canary/xenia-canary/releases/latest/download/xenia_canary_linux.AppImage"

# download latest Xenia release (windows)
wget -q --show-progress --progress=bar -c "https://github.com/xenia-canary/xenia-canary/releases/latest/download/xenia_canary_windows.7z"

# check if download was successful
if [ $? -eq 0 ]; then
    echo "Xenia Canary Windows release successfully downloaded."
else
    echo "Failed to download Xenia Canary Windows release."
    rm xenia_canary_windows.7z
    exit 1
fi

# unzip downloaded file
7z x xenia_canary_windows.7z -o"$XENIADIR"

# clean up
rm xenia_canary_windows.7z

echo "Xenia Canary download and extraction completed successfully!"
