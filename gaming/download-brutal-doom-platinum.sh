#!/usr/bin/env bash

# Exit the script immediately if any command fails
set -euo pipefail

# ASCII art header
echo -e "+--------------------------------------------------------------------------------+"
echo -e "|\e[38;5;208m             ██████╗  ██████╗  ██╗   ██╗ ████████╗  █████╗  ██╗                 \e[0m|"
echo -e "|\e[38;5;208m             ██╔══██╗ ██╔══██╗ ██║   ██║ ╚══██╔══╝ ██╔══██╗ ██║                 \e[0m|"
echo -e "|\e[38;5;208m             ██████╔╝ ██████╔╝ ██║   ██║    ██║    ███████║ ██║                 \e[0m|"
echo -e "|\e[38;5;208m             ██╔══██╗ ██╔══██╗ ██║   ██║    ██║    ██╔══██║ ██║                 \e[0m|"
echo -e "|\e[38;5;208m             ██████╔╝ ██║  ██║ ╚██████╔╝    ██║    ██║  ██║ ███████╗            \e[0m|"
echo -e "|\e[38;5;208m             ╚═════╝  ╚═╝  ╚═╝  ╚═════╝     ╚═╝    ╚═╝  ╚═╝ ╚══════╝            \e[0m|"
echo -e "|\e[38;5;208m                                                                                \e[0m|"
echo -e "|\e[38;5;208m    ▓   ▓ ▓▓▓        ▓  ▓ ▓▓▓  ▓        ▓      ▓ ▓░   ░░▓  ▓▓    ▓  ▓▓          \e[0m|"
echo -e "|\e[38;5;208m  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ░▓▓▓░▓▓▓▓▓▓▓▓░▓▒ ░░▓▓▓▓░▓▓▓▓░▓▓▓▓▓▓▓▓░▓▓▓▓░   ▓▓▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓  ▓▓▓▓▓░▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓▓░ ▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓ ▓▓▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓▒    ▓▓▓▓▒▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓░▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓▓    ▓▓▒▓▓░▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓░ ▓░▓▓▓▓░    ▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓▓▓▓▓▓░░▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓░▓▓    ▓▓▓░▓▓░▓▓▓▓▓░▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓░▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓ ▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓░▓▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓  ▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓ ▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓  ▓▓▓▓░▓▓ ░▓ ▓▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓░       ▓░▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓       ▓░▓▓▓    ▓▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓ ▓▓▓▓▓▓▓▓            ▓▓▓▓▓▓▓▓▓    ▓▓▓▓░▒▓▓▓▓            ▓▓    ▓▓▓░░▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓ ▓▓░                  ░▓▓░         ▓▓░▓                     ▓▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓▓▓▓                                                          ░▓▓▓▓▓▓   \e[0m|"
echo -e "|\e[38;5;208m    ▓▓▓▓▓                                                               ▓▓▓░░   \e[0m|"
echo -e "|\e[38;5;208m    ░▓▓                                                                   ▒▓▓   \e[0m|"
echo -e "|\e[38;5;208m                                                                                \e[0m|"
echo -e "|\e[38;5;208m    ██████╗  ██╗       █████╗  ████████╗ ██╗ ███╗   ██╗ ██╗   ██╗ ███╗   ███╗   \e[0m|"
echo -e "|\e[38;5;208m    ██╔══██╗ ██║      ██╔══██╗ ╚══██╔══╝ ██║ ████╗  ██║ ██║   ██║ ████╗ ████║   \e[0m|"
echo -e "|\e[38;5;208m    ██████╔╝ ██║      ███████║    ██║    ██║ ██╔██╗ ██║ ██║   ██║ ██╔████╔██║   \e[0m|"
echo -e "|\e[38;5;208m    ██╔═══╝  ██║      ██╔══██║    ██║    ██║ ██║╚██╗██║ ██║   ██║ ██║╚██╔╝██║   \e[0m|"
echo -e "|\e[38;5;208m    ██║      ███████╗ ██║  ██║    ██║    ██║ ██║ ╚████║ ╚██████╔╝ ██║ ╚═╝ ██║   \e[0m|"
echo -e "|\e[38;5;208m    ╚═╝      ╚══════╝ ╚═╝  ╚═╝    ╚═╝    ╚═╝ ╚═╝  ╚═══╝  ╚═════╝  ╚═╝     ╚═╝   \e[0m|"
echo -e "+--------------------------------------------------------------------------------+"

# Download URL
URL="https://github.com/EmeraldCoasttt/BrutalDoomPlatinum/archive/refs/heads/master.zip"

# Output filename
FILENAME="brutal-doom-platinum-latest.pk3"

# Check network connectivity
if ! ping -c 1 github.com &> /dev/null; then
    echo -e "\033[0;31mNo internet connection. \e[0mExiting."
    exit 1
fi

# Download latest build
if ! wget --no-verbose --progress=bar --show-progress --output-document="$FILENAME" "$URL"; then
    echo -e "\033[0;31mDownload failed. \e[0mError: $?"
    exit 1
fi

# Check if download was successful
if [ -f "$FILENAME" ]; then
    echo "Latest devoloper version of Brutal Doom Platinum downloaded successfully."
else
    echo -e "\033[0;31mFile not found after download. \e[0mExiting."
    exit 1
fi

# Extract pk3 file to temp directory
echo "Extracting contents..."
unzip -q "$FILENAME" -d temp_dir

# Navigate to root of extracted pk3
echo "Changing directory structure..."
cd temp_dir/BrutalDoomPlatinum-main
rm -rf .github

# Compress to pk3
echo "Compressing modified contents..."
zip -q -r -9 "../../BrutalDoomPlatinum-main.pk3" .

# Clean up and finalize things
cd ../..
rm -rf temp_dir
rm "$FILENAME"
mv BrutalDoomPlatinum-main.pk3 "$FILENAME"

# Success message (commented out in favor of the script sourcing this script doing the echo)
#echo "Operation completed successfully."
#echo "Rip and tear!"
