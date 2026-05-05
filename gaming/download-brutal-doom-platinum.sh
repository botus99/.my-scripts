#!/usr/bin/env bash
#=============================================================================#
# name:        download-brutal-doom-platinum.sh
# author:      botus99
# updated    : 2026-05-05
# description: downloads the latest brutal doom platinum wad
#              download happens in current directory
#=============================================================================#

# exit script if anything craps out
set -euo pipefail

#=============================================================================#
#                                   CONFIG                                    #
#=============================================================================#

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

log()    { echo -e "${GREEN}[INFO]${RESET} $1"; }
warn()   { echo -e "${YELLOW}[WARN]${RESET} $1"; }
error()  { echo -e "${RED}[ERROR]${RESET} $1"; exit 1; }

#=============================================================================#
#                               CENTERED ASCII HEADER                         #
#=============================================================================#

print_centered() {
    local TERM_WIDTH
    TERM_WIDTH=$(tput cols)

    while IFS= read -r LINE; do
        # strip ANSI color codes for length calculation
        local CLEAN_LINE
        CLEAN_LINE=$(echo -e "$LINE" | sed 's/\x1b\[[0-9;]*m//g')

        local LINE_LENGTH=${#CLEAN_LINE}
        local PADDING=$(( (TERM_WIDTH - LINE_LENGTH) / 2 ))

        printf "%*s%s\n" "$PADDING" "" "$LINE"
    done
}

print_centered << "EOF"
            ██████╗  ██████╗  ██╗   ██╗ ████████╗  █████╗  ██╗             
            ██╔══██╗ ██╔══██╗ ██║   ██║ ╚══██╔══╝ ██╔══██╗ ██║             
            ██████╔╝ ██████╔╝ ██║   ██║    ██║    ███████║ ██║             
            ██╔══██╗ ██╔══██╗ ██║   ██║    ██║    ██╔══██║ ██║             
            ██████╔╝ ██║  ██║ ╚██████╔╝    ██║    ██║  ██║ ███████╗        
            ╚═════╝  ╚═╝  ╚═╝  ╚═════╝     ╚═╝    ╚═╝  ╚═╝ ╚══════╝        

  ▓   ▓ ▓▓▓        ▓  ▓ ▓▓▓  ▓        ▓      ▓ ▓░   ░░▓  ▓▓    ▓  ▓▓       
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ░▓▓▓░▓▓▓▓▓▓▓▓░▓▒ ░░▓▓▓▓░▓▓▓▓░▓▓▓▓▓▓▓▓░▓▓▓▓░   ▓▓▓▓▓▓▓▓
  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓  ▓▓▓▓▓░▓▓
  ▓▓▓▓▓▓▓░ ▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓ ▓▓▓▓▓▓▓▓
  ▓▓▓▓▓▓▒    ▓▓▓▓▒▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓
  ▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓░▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
  ▓▓▓▓▓▓▓    ▓▓▒▓▓░▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓░ ▓░▓▓▓▓░    ▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓▓▓▓▓▓░░▓▓▓
  ▓▓▓▓░▓▓    ▓▓▓░▓▓░▓▓▓▓▓░▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░
  ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
  ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░
  ▓▓▓▓░▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
  ▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓ ▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
  ▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
  ▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓░▓▓▓▓▓▓▓
  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓  ▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓ ▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓  ▓▓▓▓░▓▓ ░▓ ▓▓▓▓▓▓▓
  ▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓░       ▓░▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓       ▓░▓▓▓    ▓▓▓▓▓▓▓
  ▓▓▓▓ ▓▓▓▓▓▓▓▓            ▓▓▓▓▓▓▓▓▓    ▓▓▓▓░▒▓▓▓▓            ▓▓    ▓▓▓░░▓▓
  ▓▓▓▓▓▓ ▓▓░                  ░▓▓░         ▓▓░▓                     ▓▓▓▓▓▓▓
  ▓▓▓▓▓▓▓▓                                                          ░▓▓▓▓▓▓
  ▓▓▓▓▓                                                               ▓▓▓░░
  ░▓▓                                                                   ▒▓▓

  ██████╗  ██╗       █████╗  ████████╗ ██╗ ███╗   ██╗ ██╗   ██╗ ███╗   ███╗
  ██╔══██╗ ██║      ██╔══██╗ ╚══██╔══╝ ██║ ████╗  ██║ ██║   ██║ ████╗ ████║
  ██████╔╝ ██║      ███████║    ██║    ██║ ██╔██╗ ██║ ██║   ██║ ██╔████╔██║
  ██╔═══╝  ██║      ██╔══██║    ██║    ██║ ██║╚██╗██║ ██║   ██║ ██║╚██╔╝██║
  ██║      ███████╗ ██║  ██║    ██║    ██║ ██║ ╚████║ ╚██████╔╝ ██║ ╚═╝ ██║
  ╚═╝      ╚══════╝ ╚═╝  ╚═╝    ╚═╝    ╚═╝ ╚═╝  ╚═══╝  ╚═════╝  ╚═╝     ╚═╝
EOF

# download URL
URL="https://github.com/EmeraldCoasttt/BrutalDoomPlatinum/archive/refs/heads/master.zip"

# output filename
FILENAME="brutal-doom-platinum-latest.pk3"

# check network connectivity
if ! ping -c 1 github.com &> /dev/null; then
    error "No internet connection. Exiting."
fi

#=============================================================================#
#                       CHECK FOR NEWER GITHUB COMMIT                         #
#=============================================================================#

API_URL="https://api.github.com/repos/EmeraldCoasttt/BrutalDoomPlatinum/commits/main"

log "Checking for latest commit on GitHub..."

# get latest commit ISO timestamp (e.g., 2024-01-01T12:34:56Z)
LATEST_COMMIT_DATE=$(curl -s "$API_URL" | jq -r '.commit.committer.date' 2>/dev/null || true)

if [ -z "$LATEST_COMMIT_DATE" ]; then
    warn "Could not fetch latest commit info. Proceeding with download..."
else
    # convert to epoch time
    REMOTE_EPOCH=$(date -d "$LATEST_COMMIT_DATE" +%s)

    if [ -f "$FILENAME" ]; then
        LOCAL_EPOCH=$(stat -c %Y "$FILENAME")

        if [ "$REMOTE_EPOCH" -le "$LOCAL_EPOCH" ]; then
            log "Latest version already installed. Skipping download."
            exit 0
        else
            log "Newer version detected. Proceeding with download..."
        fi
    else
        log "No existing file found. Proceeding with download..."
    fi
fi

#=============================================================================#
#                            DOWNLOAD AND INSTALL                             #
#=============================================================================#

# download latest build
if ! wget --no-verbose --progress=bar --show-progress --output-document="$FILENAME" "$URL"; then
    error "Download failed. Error: $?"
fi

# check if download was successful
if [ -f "$FILENAME" ]; then
    log "Latest devoloper version of Brutal Doom Platinum downloaded successfully."
else
    error "File not found after download. Exiting."
fi

#=============================================================================#
# the lines below recompress the pk3 to...
#  - remove unneeded directories
#  - save some disk space (very little... this is Doom after all)
#
# this is totally unnessesary, a waste of time, and a waste of resources (IMO)
# leaving here to preserve my stupid idea in case it is useful for someone else
#=============================================================================#

# # extract pk3 file to temp directory
# log "Extracting contents..."
# unzip -q "$FILENAME" -d temp_dir

# # navigate to root of extracted pk3
# log "Changing directory structure..."
# cd temp_dir/BrutalDoomPlatinum-main
# rm -rf .github

# # compress to pk3
# log "Compressing modified contents..."
# zip -q -r -9 "../../BrutalDoomPlatinum-main.pk3" .

# # final cleanup
# cd ../..
# rm -rf temp_dir
# rm "$FILENAME"
# mv BrutalDoomPlatinum-main.pk3 "$FILENAME"

# Success message (commented out in favor sourcing this script and doing success messages there)
#log "Operation completed successfully."
#log "Rip and tear!"
