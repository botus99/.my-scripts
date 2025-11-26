#!/usr/bin/env bash

# Set variables
URL="https://github.com/stenzek/emu-shaders/archive/refs/heads/master.zip"
DUCK_DIR="$HOME/.local/share/duckstation/shaders"

# Check network connectivity
if ! ping -c 1 github.com &> /dev/null; then
    echo -e "\033[0;31mNo internet connection. \e[0mExiting."
    exit 1
else
    echo "Downloading extra shaders for Duckstation..."
fi

# Download the zip file
wget --quiet "$URL" --output-document="${DUCK_DIR}/emu-shaders.zip" || { echo "Failed to download the file. Please check the URL and network connection."; exit 1; }

# Check if download was successful
if [ $? -eq 0 ]; then

    # Success message
    echo "Extra Duckstation shaders downloaded successfully."
    echo "Installing shaders..."

    # Extract the zip file
    unzip -q "${DUCK_DIR}/emu-shaders.zip" -d "${DUCK_DIR}" || { echo "Failed to extract the zip file."; exit 1; }

    # Remove old shaders
    rm -rf "${DUCK_DIR}/reshade" "${DUCK_DIR}/dolphinfx"

    # Create needed directories
    mkdir -p "${DUCK_DIR}/reshade/Shaders" "${DUCK_DIR}/reshade/Textures" "${DUCK_DIR}/dolphinfx"

    # Move extracted files to where Duckstation wants them
    mv --force --update=all "${DUCK_DIR}/emu-shaders-master/reshade/Shaders" "${DUCK_DIR}/reshade/"
    mv --force --update=all "${DUCK_DIR}/emu-shaders-master/reshade/Textures" "${DUCK_DIR}/reshade/"
    mv --force --update=all "${DUCK_DIR}/emu-shaders-master/dolphinfx" "${DUCK_DIR}/"

    # Cleanup our leftover mess
    rm "${DUCK_DIR}/emu-shaders.zip"
    rm -rf "${DUCK_DIR}/emu-shaders-master"

    # Success message
    echo "Installed extra Duckstation shaders successfully."
else
    echo "Failed to install extra shaders."
fi
