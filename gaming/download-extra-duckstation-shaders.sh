#!/usr/bin/env bash

# Set variables
URL="https://github.com/stenzek/emu-shaders/archive/refs/heads/master.zip"
DIRECTORY="$HOME/.var/app/org.duckstation.DuckStation/config/duckstation/shaders"

# Download the zip file
wget "$URL" -O "${DIRECTORY}/emu-shaders.zip"

# Check if download was successful
if [ $? -eq 0 ]; then

    # Extract the zip file
    unzip -q "${DIRECTORY}/emu-shaders.zip" -d "${DIRECTORY}"

    # Move the extracted stuff to better spots
    mv --force "${DIRECTORY}/emu-shaders-master/reshade/Shaders/" "${DIRECTORY}/reshade/Shaders/"
    mv --force "${DIRECTORY}/emu-shaders-master/reshade/Textures/" "${DIRECTORY}/reshade/Textures/"
    mv --force "${DIRECTORY}/emu-shaders-master/dolphinfx/" "${DIRECTORY}/dolphinfx/"

    # Cleanup our leftover mess
    rm "${DIRECTORY}/emu-shaders.zip"
    rm -rf "${DIRECTORY}/emu-shaders-master"

    # Success or failure message
    echo "Installed extra Duckstation shaders successfully."
else
    echo "Failed to download the file. Please check the URL and network connection."
fi
