#!/usr/bin/env bash
#=============================================================================#
# name:        download-RetroCrisis-shaders.sh
# author:      botus99
# messed with: 2026-04-19
# description: downloads / installs / updates the Retro Crisis GDV NTSC shaders
#              for retroarch (flatpak). adjust BASE_DIR in the config below to
#              change this
#=============================================================================#

# exit script if anything craps out
set -euo pipefail

#=============================================================================#
#                                   CONFIG                                    #
#=============================================================================#

BASE_DIR="$HOME/.var/app/org.libretro.RetroArch/config/retroarch"
OLD_DIR="$BASE_DIR/shaders/shaders_slang/retro crisis"
ZIP_FILE="$BASE_DIR/Retro-Crisis-GDV-NTSC-latest.zip"

# cleanup on exit (success or failure)
trap 'rm -f "$ZIP_FILE"' EXIT

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

log()    { echo -e "${GREEN}[INFO]${RESET} $1"; }
warn()   { echo -e "${YELLOW}[WARN]${RESET} $1"; }
error()  { echo -e "${RED}[ERROR]${RESET} $1"; exit 1; }

#=============================================================================#
#                               SANITY CHECKS                                 #
#=============================================================================#

log "Checking internet connectivity..."
ping -c 1 github.com &> /dev/null || error "No internet connection."

# check dependencies
for cmd in curl jq unzip; do
    command -v "$cmd" &>/dev/null || error "Missing dependency: $cmd"
done

mkdir -p "$BASE_DIR"

#=============================================================================#
#                              DOWNLOAD SHADERS                               #
#=============================================================================#

log "Fetching latest release info..."

RELEASES=$(curl --silent "https://api.github.com/repos/RetroCrisis/Retro-Crisis-GDV-NTSC/releases/latest")
LATEST_URL=$(echo "$RELEASES" | jq -r '.assets[0].browser_download_url')

[ -z "$LATEST_URL" ] && error "Failed to get download URL."

log "Downloading latest shaders..."
curl --silent --fail -L "$LATEST_URL" -o "$ZIP_FILE"
log "Shaders downloaded successfully..."

[ ! -f "$ZIP_FILE" ] && error "Download failed."

#=============================================================================#
#                              INSTALL SHADERS                                #
#=============================================================================#

if [ -d "$OLD_DIR" ]; then
    log "Removing old shaders..."
    rm -rf "$OLD_DIR"
fi

log "Extracting shaders..."
# keep that macOS junk off of my system
unzip -oq "$ZIP_FILE" -d "$BASE_DIR" -x "__MACOSX/*" "*.DS_Store"

log "Cleaning up..."
# technically unnecessary because of the trap setup earlier in the script.
# leaving here for clarity/posterity/in case of removal of trap for some reason
rm -f "$ZIP_FILE"

#=============================================================================#
#                                   DONE                                      #
#=============================================================================#

log "RetroCrisis shaders installed successfully!"
