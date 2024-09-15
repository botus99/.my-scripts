#!/usr/bin/env bash

# STAGING
### Define the source and destination directories
old_dir="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/bezel/Mega_Bezel"
src_zip="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/Mega_Bezel-latest.zip"
dest_dir="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/bezel"

### Fetch the releases page
releases_page=$(curl --silent "https://api.github.com/repos/HyperspaceMadness/Mega_Bezel/releases/latest")
latest_release=$(curl --silent "https://api.github.com/repos/HyperspaceMadness/Mega_Bezel/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

### Extract the download URL of the latest release asset
latest_release_url=$(echo "$releases_page" | jq -r '.assets[0].browser_download_url')

### Create the destination directory if it doesn't already exist
mkdir -p "$dest_dir"

### Check if the directory already exists
if [ -d "$old_dir" ]; then
    # If the directory exists, delete it
    rm -rf "$old_dir"
    echo "Old Mega_Bezel shaders deleted successfully."
fi

### Check if the source zip exists
if [ ! -f "$src_zip" ]; then
    echo "Source file does not exist: $src_zip"
fi

# DOWNLOAD SHADERS
### Download the latest release
curl -L "$latest_release_url" -o "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/Mega_Bezel-latest.zip"
echo "Downloaded latest Mega_Bezel shaders successfully."

### Extract the zip file to the destination directory
unzip "$src_zip" -d "$dest_dir"
mv "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/bezel/$latest_release/Mega_Bezel" "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/bezel/Mega_Bezel"
echo "New Mega_Bezel shaders extracted successfully."

### Remove downloaded zip file
rm "$src_zip"
rm -rf "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders/shaders_slang/bezel/$latest_release"
echo "Cleanup performed successfully"
