#!/usr/bin/env bash
#=============================================================================#
# Name:        download-Mega_Bezel-shaders.sh
# Author:      botus99
# Updated:     2026-04-19
# Description: downloads and installs the latest Mega Bezel shaders for...
#              retroarch (flatpak)
#=============================================================================#

# exit script if anything craps out
set -euo pipefail

#=============================================================================#
#                                   CONFIG                                    #
#=============================================================================#

BASE_DIR="$HOME/.var/app/org.libretro.RetroArch/config/retroarch"
SHADER_DIR="$BASE_DIR/shaders/shaders_slang"
DEST_DIR="$SHADER_DIR/bezel"
OLD_DIR="$DEST_DIR/Mega_Bezel"
ZIP_FILE="$SHADER_DIR/Mega_Bezel-latest.zip"
API_URL="https://api.github.com/repos/HyperspaceMadness/Mega_Bezel/releases/latest"

# colors
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

log()    { echo -e "${GREEN}[INFO]${RESET} $1"; }
warn()   { echo -e "${YELLOW}[WARN]${RESET} $1"; }
error()  { echo -e "${RED}[ERROR]${RESET} $1"; exit 1; }

# cleanup on exit
trap 'rm -f "$ZIP_FILE"' EXIT

#=============================================================================#
#                               SANITY CHECKS                                 #
#=============================================================================#

log "Checking GitHub connectivity..."
curl --silent --fail https://api.github.com >/dev/null \
    || error "Cannot reach GitHub API."

for cmd in curl jq unzip; do
    command -v "$cmd" &>/dev/null || error "Missing dependency: $cmd"
done

mkdir -p "$DEST_DIR"

#=============================================================================#
#                              FETCH RELEASE INFO                             #
#=============================================================================#

log "Fetching latest release info..."

RELEASES=$(curl --silent "$API_URL")
LATEST_TAG=$(echo "$RELEASES" | jq -r '.tag_name')
LATEST_URL=$(echo "$RELEASES" | jq -r '.assets[] | select(.name | endswith(".zip")) | .browser_download_url' | head -n 1)

[ -z "$LATEST_URL" ] && error "Failed to get download URL."

#=============================================================================#
#                              DOWNLOAD SHADERS                               #
#=============================================================================#

log "Downloading Mega Bezel shaders ($LATEST_TAG)..."
curl --fail --location --silent "$LATEST_URL" -o "$ZIP_FILE"

#=============================================================================#
#                              INSTALL SHADERS                                #
#=============================================================================#

if [ -d "$OLD_DIR" ]; then
    log "Removing old shaders..."
    rm -rf "$OLD_DIR"
fi

log "Extracting shaders..."
unzip -oq "$ZIP_FILE" -d "$DEST_DIR"

log "Finalizing directory structure..."
mv "$DEST_DIR/$LATEST_TAG/Mega_Bezel" "$OLD_DIR"
rm -rf "$DEST_DIR/$LATEST_TAG"

#=============================================================================#
#                                   DONE                                      #
#=============================================================================#

log "Mega Bezel shaders installed successfully!"
