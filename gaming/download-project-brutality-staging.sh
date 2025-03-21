#!/usr/bin/env bash

# ASCII art header
echo -e "+----------------------------------------------------------------------------------------+"
echo -e "|\e[38;5;208m        ▓   ▓ ▓▓▓        ▓  ▓ ▓▓▓  ▓        ▓      ▓ ▓░   ░░▓  ▓▓    ▓  ▓▓              \e[0m|"
echo -e "|\e[38;5;208m      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ░▓▓▓░▓▓▓▓▓▓▓▓░▓▒ ░░▓▓▓▓░▓▓▓▓░▓▓▓▓▓▓▓▓░▓▓▓▓░   ▓▓▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓  ▓▓▓▓▓░▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓▓░ ▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓ ▓▓▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓▒    ▓▓▓▓▒▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓░▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓▓    ▓▓▒▓▓░▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓░ ▓░▓▓▓▓░    ▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓▓▓▓▓▓░░▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓░▓▓    ▓▓▓░▓▓░▓▓▓▓▓░▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓░▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓ ▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓░▓▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓  ▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓ ▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓  ▓▓▓▓░▓▓ ░▓ ▓▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓░       ▓░▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓       ▓░▓▓▓    ▓▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓ ▓▓▓▓▓▓▓▓            ▓▓▓▓▓▓▓▓▓    ▓▓▓▓░▒▓▓▓▓            ▓▓    ▓▓▓░░▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓ ▓▓░                  ░▓▓░         ▓▓░▓                     ▓▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓▓▓▓                                                          ░▓▓▓▓▓▓       \e[0m|"
echo -e "|\e[38;5;208m        ▓▓▓▓▓                                                               ▓▓▓░░       \e[0m|"
echo -e "|\e[38;5;208m        ░▓▓                                                                   ▒▓▓       \e[0m|"
echo -e "|\e[38;5;208m                                                                                        \e[0m|"
echo -e "|\e[38;5;208m            ██████╗  ██████╗   ██████╗       ██╗ ███████╗  ██████╗ ████████╗            \e[0m|"
echo -e "|\e[38;5;208m            ██╔══██╗ ██╔══██╗ ██╔═══██╗      ██║ ██╔════╝ ██╔════╝ ╚══██╔══╝            \e[0m|"
echo -e "|\e[38;5;208m            ██████╔╝ ██████╔╝ ██║   ██║      ██║ █████╗   ██║         ██║               \e[0m|"
echo -e "|\e[38;5;208m            ██╔═══╝  ██╔══██╗ ██║   ██║ ██   ██║ ██╔══╝   ██║         ██║               \e[0m|"
echo -e "|\e[38;5;208m            ██║      ██║  ██║ ╚██████╔╝ ╚█████╔╝ ███████╗ ╚██████╗    ██║               \e[0m|"
echo -e "|\e[38;5;208m            ╚═╝      ╚═╝  ╚═╝  ╚═════╝   ╚════╝  ╚══════╝  ╚═════╝    ╚═╝               \e[0m|"
echo -e "|\e[38;5;208m                                                                                        \e[0m|"
echo -e "|\e[38;5;208m     ██████╗  ██████╗  ██╗   ██╗ ████████╗  █████╗  ██╗      ██╗ ████████╗ ██╗   ██╗    \e[0m|"
echo -e "|\e[38;5;208m     ██╔══██╗ ██╔══██╗ ██║   ██║ ╚══██╔══╝ ██╔══██╗ ██║      ██║ ╚══██╔══╝ ╚██╗ ██╔╝    \e[0m|"
echo -e "|\e[38;5;208m     ██████╔╝ ██████╔╝ ██║   ██║    ██║    ███████║ ██║      ██║    ██║     ╚████╔╝     \e[0m|"
echo -e "|\e[38;5;208m     ██╔══██╗ ██╔══██╗ ██║   ██║    ██║    ██╔══██║ ██║      ██║    ██║      ╚██╔╝      \e[0m|"
echo -e "|\e[38;5;208m     ██████╔╝ ██║  ██║ ╚██████╔╝    ██║    ██║  ██║ ███████╗ ██║    ██║       ██║       \e[0m|"
echo -e "|\e[38;5;208m     ╚═════╝  ╚═╝  ╚═╝  ╚═════╝     ╚═╝    ╚═╝  ╚═╝ ╚══════╝ ╚═╝    ╚═╝       ╚═╝       \e[0m|"
echo -e "+----------------------------------------------------------------------------------------+"

# Download URL
URL="https://github.com/pa1nki113r/Project_Brutality/archive/refs/heads/PB_Staging.zip"

# Output filename
OUTPUT_FILE="project-brutality-staging.pk3"

# Check network connectivity
if ! ping -c 1 github.com &> /dev/null; then
    echo -e "\033[0;31mNo internet connection. \e[0mExiting."
    exit 1
fi

# Download the file using wget with a progress bar and continuing a partially downloaded file if applicable
if ! wget --no-verbose --progress=bar --show-progress --continue --output-document="$OUTPUT_FILE" "$URL"; then
    echo -e "\033[0;31mDownload failed. \e[0mError: $?"
    exit 1
fi

# Check if download was successful
if [ -f "$OUTPUT_FILE" ]; then
    echo -e "Latest staging version of Project Brutality downloaded successfully."
    echo -e "\033[0;31mRip and tear!\e[0m"
else
    echo -e "\033[0;31mFile not found after download. \e[0mExiting."
    exit 1
fi