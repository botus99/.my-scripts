#!/usr/bin/env bash

#=============================================================================#
#                                   STAGING                                   #
#=============================================================================#

# Define the source and destination directories
OLD_DIR="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/bezel/Mega_Bezel"
SRC_ZIP="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/Mega_Bezel-latest.zip"
DEST_DIR="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/bezel"

# Fetch the releases page
RELEASES=$(curl --silent "https://api.github.com/repos/HyperspaceMadness/Mega_Bezel/releases/latest")
LATEST_RELEASE=$(curl --silent "https://api.github.com/repos/HyperspaceMadness/Mega_Bezel/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# Extract the download URL of the latest release asset
LATEST_RELEASE_URL=$(echo "$RELEASES" | jq -r '.assets[0].browser_download_url')

# Create the destination directory if it doesn't already exist
mkdir -p "$DEST_DIR"

# Check if the directory already exists
if [ -d "$OLD_DIR" ]; then
    # If the directory exists, delete it
    rm -rf "$OLD_DIR"
    echo "Old Mega_Bezel shaders deleted successfully."
fi

# Check if the source zip exists
if [ ! -f "$SRC_ZIP" ]; then
    echo "Source file does not exist: $SRC_ZIP"
fi

#=============================================================================#
#                               DOWNLOAD SHADERS                              #
#=============================================================================#

# Download the latest release
curl -L "$LATEST_RELEASE_URL" -o "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/Mega_Bezel-latest.zip"
echo "Downloaded latest Mega_Bezel shaders successfully."

# Extract the zip file to the destination directory
unzip "$SRC_ZIP" -d "$DEST_DIR"
mv "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/bezel/$LATEST_RELEASE/Mega_Bezel" "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/bezel/Mega_Bezel"
echo "New Mega_Bezel shaders extracted successfully."

# Remove downloaded zip file
rm "$SRC_ZIP"
rm -rf "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/bezel/$LATEST_RELEASE"
echo "Cleanup performed successfully"
