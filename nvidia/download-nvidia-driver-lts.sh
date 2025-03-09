#!/usr/bin/env bash

# Exit if anything fails
set -euo pipefail

# Download latest.txt from NVIDIA
wget -q "https://download.nvidia.com/XFree86/Linux-x86_64/latest.txt" -O "latest.txt"

# Check if latest.txt exists
if [ ! -f "latest.txt" ]; then
    echo "Error: latest.txt not found."
    exit 1
fi

# Read the latest driver version from latest.txt
LATEST_VERSION=$(head -n 1 "latest.txt" | awk '{print $2}')
FILENAME=$(grep -oP '/\K[^ ]+\.run' latest.txt)

# Construct the URL for downloading the .run file
url="https://download.nvidia.com/XFree86/Linux-x86_64/${LATEST_VERSION}"

# Download the file
wget -q --show-progress --progress=bar -c "$url" -O "${FILENAME}"

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

# Remove latest.txt file
rm ./latest.txt

# Final message
echo "Make sure to do research before installing/upgrading."
echo "Good luck with the installation!"
