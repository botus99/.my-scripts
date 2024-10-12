#!/usr/bin/env bash

# Set the screen and text color to red
echo -e "\e[34m\e[91m"

# Get the date and format it as YYYY-MM-DD
dt=$(date +"%Y-%m-%d")
name="Project_Brutality"

echo "Downloading ${name}_${dt}"
echo "Please Wait..."

# Use wget to download the latest staging zip and rename it
wget --output-document "${name}_${dt}.pk3" https://github.com/pa1nki113r/Project_Brutality/archive/refs/heads/PB_Staging.zip

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download complete."
else
    echo "Error: Download failed."
fi
