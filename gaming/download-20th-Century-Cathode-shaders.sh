#!/usr/bin/env bash
#=============================================================================#
# name:        download-20th-Century-Cathode-shaders.sh
# author:      botus99
# messed with: 2026-04-19
# description: downloads / installs / updates the 20th-Century-Cathode shaders
#              for retroarch (flatpak). adjust BASE_DIR in the config below to
#              change this
#=============================================================================#

# exit script if anything craps out
set -euo pipefail

#=============================================================================#
#                                   CONFIG                                    #
#=============================================================================#

BASE_DIR="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/shaders"
TARGET_DIR="$BASE_DIR/Mega_Bezel_Packs"
REPO_DIR="$TARGET_DIR/20th-Century-Cathode"
REPO_URL="https://github.com/Vriom-grafisk/Vriom-20th-Century-Cathode"

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

log "Checking GitHub connectivity..."
git ls-remote "$REPO_URL" &>/dev/null || error "Cannot reach GitHub repository."

command -v git &>/dev/null || error "Missing dependency: git"

mkdir -p "$TARGET_DIR"

#=============================================================================#
#                              INSTALL / UPDATE                               #
#=============================================================================#

if [ ! -d "$REPO_DIR" ]; then
    log "Cloning 20th-Century-Cathode shaders..."
    git clone "$REPO_URL" "$REPO_DIR"
else
    log "Updating existing shaders..."
    git -C "$REPO_DIR" pull --ff-only
fi

#=============================================================================#
#                                   DONE                                      #
#=============================================================================#

log "20th-Century-Cathode shaders are installed and up to date!"
