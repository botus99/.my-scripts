#!/usr/bin/env bash

# Exit if anything fails
set -euo pipefail

# Repository for 64bit Linux drivers
REPO="https://download.nvidia.com/XFree86/Linux-x86_64/"

# Download the index page content
curl -s "$REPO" | grep -oP '[0-9]+\.[0-9]+\.[0-9]+' > drivers.txt

# Get the latest version number from the last line of drivers.txt
VERSION=$(tail -n 1 drivers.txt)
FILENAME="NVIDIA-Linux-x86_64-${VERSION}.run"

# Print the latest version
echo -e "Downloading latest NVIDIA driver version: \033[32m\033[01m$VERSION\033[00m"

# Construct the URL for downloading the .run file
URL="https://download.nvidia.com/XFree86/Linux-x86_64/${VERSION}/${FILENAME}"

# Download the driver
# I kept curl because of less dependencies plus download speed is fine
# I commented out wget and aria2c for easy swapping if desired
curl --progress-bar --continue-at - "$URL" --output "${FILENAME}"
#wget -q --show-progress --progress=bar -c "$URL" -O "${FILENAME}"
#aria2c -x 16 -s 16 -c "$URL" -o "${FILENAME}"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo -e "Downloaded \033[32m\033[01m${FILENAME}\033[00m successfully."
else
    echo -e "\033[31mFailed to download \033[0m\033[00m${FILENAME}\033[01m\033[00m"
    exit 1
fi

# Make .run file executable
if chmod +x "${FILENAME}"; then
    echo -e "\033[32m\033[01m${FILENAME}\033[00m is now executable."
else
    echo -e "${FILENAME} \033[31m\033[01mis not executable.\033[00m"
    exit 1
fi

# Clean up
rm drivers.txt

# Final message
echo "Make sure to do research before installing/upgrading."
echo "Good luck with the installation!"
