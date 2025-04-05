#!/usr/bin/env bash

#=============================================================================#
#                                   STAGING                                   #
#=============================================================================#

# Define the source and destination directories
OLD_DIR="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/retro crisis"
SRC_ZIP="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/Retro-Crisis-GDV-NTSC-latest.zip"
DEST_DIR="$HOME/.var/app/org.libretro.RetroArch/config/retroarch"

# Create the destination directory if it doesn't already exist
mkdir -p "$DEST_DIR"

# Check if the directory already exists
if [ -d "$OLD_DIR" ]; then
    # If the directory exists, delete it
    rm -rf "$OLD_DIR"
    echo "Old RetroCrisis shaders deleted successfully."
fi

# Check if the source zip exists
if [ ! -f "$SRC_ZIP" ]; then
    echo "Source file does not exist: $SRC_ZIP"
fi

#=============================================================================#
#                               DOWNLOAD SHADERS                              #
#=============================================================================#

# Fetch the releases page
RELEASES=$(curl --silent "https://api.github.com/repos/RetroCrisis/Retro-Crisis-GDV-NTSC/releases/latest")

# Extract the download URL of the latest release asset
LATEST_RELEASE_URL=$(echo "$RELEASES" | jq -r '.assets[0].browser_download_url')

# Download the latest release
curl -L "$LATEST_RELEASE_URL" -o "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/Retro-Crisis-GDV-NTSC-latest.zip"
echo "Downloaded latest RetroCrisis shaders successfully."

# Extract the zip file to the destination directory
unzip "$SRC_ZIP" -d "$DEST_DIR"
echo "New RetroCrisis shaders extracted successfully."

# Remove downloaded zip file
rm "$SRC_ZIP"
echo "Cleanup performed successfully"
