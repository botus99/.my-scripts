#!/usr/bin/env bash
#=============================================================================#
# name:        download-extra-duckstation-shaders.sh
# author:      botus99
# messed with: 2026-04-20
# description: stenzek has a repo of extra shaders for duckstaion
#              all this script does is download/install them
#=============================================================================#

# exit script if anything craps out
set -euo pipefail

#=============================================================================#
#                                   CONFIG                                    #
#=============================================================================#

URL="https://github.com/stenzek/emu-shaders/archive/refs/heads/master.zip"
DUCK_DIR="$HOME/.local/share/duckstation/shaders"
ZIP_FILE="$DUCK_DIR/emu-shaders.zip"
EXTRACT_DIR="$DUCK_DIR/emu-shaders-master"

# colors
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

log()   { echo -e "${GREEN}[INFO]${RESET} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${RESET} $1"; }
error() { echo -e "${RED}[ERROR]${RESET} $1"; exit 1; }

#=============================================================================#
#                               SANITY CHECKS                                 #
#=============================================================================#

log "Checking internet connectivity..."
curl --silent --fail https://github.com >/dev/null \
    || error "Cannot reach GitHub."

log "Checking dependencies..."
for cmd in wget unzip; do
    command -v "$cmd" &>/dev/null || error "Missing dependency: $cmd"
done

mkdir -p "$DUCK_DIR"

#=============================================================================#
#                                   MAIN                                      #
#=============================================================================#

main() {
    log "Downloading extra shaders for Duckstation..."

    # download the zip file
    wget --quiet --output-document="$ZIP_FILE" "$URL" \
        || error "Download failed."

    log "Download completed successfully."

    # extract the zip file
    log "Extracting shaders..."
    unzip -q "$ZIP_FILE" -d "$DUCK_DIR" \
        || error "Extraction failed."

    # remove old shaders
    log "Preparing shader directories..."
    rm -rf "$DUCK_DIR/reshade" "$DUCK_DIR/dolphinfx"

    # create needed folders where Duckstation wants them
    mkdir -p "$DUCK_DIR/reshade/Shaders" \
             "$DUCK_DIR/reshade/Textures" \
             "$DUCK_DIR/dolphinfx"

    # move extracted files where Duckstation wants them
    log "Installing shaders..."
    mv --force --update=all "$EXTRACT_DIR/reshade/Shaders" "$DUCK_DIR/reshade/"
    mv --force --update=all "$EXTRACT_DIR/reshade/Textures" "$DUCK_DIR/reshade/"
    mv --force --update=all "$EXTRACT_DIR/dolphinfx" "$DUCK_DIR/"

    # cleanup after ourselves
    log "Cleaning up..."
    rm -f "$ZIP_FILE"
    rm -rf "$EXTRACT_DIR"

    log "DuckStation shaders installed successfully."
}

main