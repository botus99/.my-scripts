#!/usr/bin/env bash

# STAGING
### Define the source and destination directories
old_dir="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/retro crisis"
src_zip="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/Retro-Crisis-GDV-NTSC-latest.zip"
dest_dir="$HOME/.var/app/org.libretro.RetroArch/config/retroarch"

### Create the destination directory if it doesn't already exist
mkdir -p "$dest_dir"

# DOWNLOAD SHADERS
### Fetch the releases page
releases_page=$(curl --silent "https://api.github.com/repos/RetroCrisis/Retro-Crisis-GDV-NTSC/releases/latest")

### Extract the download URL of the latest release asset
latest_release_url=$(echo "$releases_page" | jq -r '.assets[0].browser_download_url')

### Download the latest release
curl -L "$latest_release_url" -o "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/Retro-Crisis-GDV-NTSC-latest.zip"
echo "Downloaded latest RetroCrisis shaders successfully."

# EXTRACT SHADERS
### Check if the directory already exists
if [ -d "$old_dir" ]; then
    # If the directory exists, delete it
    rm -rf "$old_dir"
    echo "Old RetroCrisis shaders deleted successfully."
fi

### Check if the source zip exists
if [ ! -f "$src_zip" ]; then
    echo "Source file does not exist: $src_zip"
    exit 1
fi

### Extract the zip file to the destination directory
unzip "$src_zip" -d "$dest_dir"
echo "New RetroCrisis shaders extracted successfully."

### Remove downloaded zip file
rm "$src_zip"
echo "Cleanup performed successfully"
