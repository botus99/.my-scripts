#!/usr/bin/env bash
#=============================================================================#
# name:        download-betterfox.sh
# author:      botus99
# messed with: 2026-04-20
# description: downloads and installs the latest betterfox configs
#=============================================================================#

# exit script if anything craps out
set -euo pipefail

#=============================================================================#
#                                   CONFIG                                    #
#=============================================================================#

MOZILLA_DIR="$HOME/.mozilla"
TMP_DIR="$(mktemp -d)"

# ensure cleanup always happens
trap 'rm -rf "$TMP_DIR"' EXIT

BASE_URL="https://github.com/yokoffing/Betterfox/raw/refs/heads/main"

FILES=(
    "user.js"
    "Fastfox.js"
    "Securefox.js"
    "Peskyfox.js"
    "Smoothfox.js"
)

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

log()   { echo -e "${GREEN}[INFO]${RESET} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${RESET} $1"; }
error() { echo -e "${RED}[ERROR]${RESET} $1"; exit 1; }

separator() {
    local COLS
    COLS=$(tput COLS 2>/dev/null || echo "${COLUMNS:-80}")
    printf "${YELLOW}%*s${RESET}\n" "$COLS" '' | tr ' ' '='
}

#=============================================================================#
#                               SANITY CHECKS                                 #
#=============================================================================#

log "Checking internet connectivity..."
curl --silent --fail https://github.com >/dev/null \
    || error "Cannot reach GitHub."

command -v wget &>/dev/null || error "Missing dependency: wget"

mkdir -p "$MOZILLA_DIR"

#=============================================================================#
#                                   MAIN                                      #
#=============================================================================#

main() {
    separator
    log "Downloading Betterfox configs..."

    for FILE in "${FILES[@]}"; do
        URL="$BASE_URL/$FILE"

        (
            cd "$TMP_DIR"
            wget --quiet --show-progress --progress=bar:force:noscroll \
                --output-document="$FILE" "$URL"
        ) || error "Failed to download $FILE"
    done

    log "All files downloaded successfully."

    separator
    log "Installing Betterfox configs..."

    for FILE in "${FILES[@]}"; do
        local TARGET="$MOZILLA_DIR/$FILE"

        if [[ -f "$TARGET" ]]; then
            rm -f "$TARGET"
            log "Removed old $FILE"
        fi

        mv "$TMP_DIR/$FILE" "$TARGET"
        log "Installed new $FILE"
    done

    # not actually true, cleanup happens on exit whether successful or not
    # just letting the user know that the script cleans up after itself
    log "Cleaning temp files..."
    separator
    log "Betterfox configs installed successfully."
}

main