#!/usr/bin/env bash
#=============================================================================#
# name:        update-wads.sh
# author:      botus99
# messed with: 2026-05-05
# description: script to download the newest versions of my favorite doom wads
#              scripts in SCRIPT_PATH are needed, note the SCRIPT_PATH location
#
# note:        if you do not have a DOOMWADDIR set up, it would be better in...
#               - `~/.profile` (my reccommendation)
#               - `/etc/environment`
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

log()   { echo -e "${GREEN}[INFO]${RESET} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${RESET} $1"; }
error() { echo -e "${RED}[ERROR]${RESET} $1"; exit 1; }

#=============================================================================#
#                               HELPER FUNCS                                  #
#=============================================================================#

separator() {
    local COLS
    COLS=$(tput cols 2>/dev/null || echo "${COLUMNS:-80}")
    printf "${YELLOW}%*s${RESET}\n" "$COLS" '' | tr ' ' '='
}

#=============================================================================#
#                               SANITY CHECKS                                 #
#=============================================================================#

[[ -z "${DOOMWADDIR:-}" ]] && error "DOOMWADDIR is not set"
[[ ! -d "$DOOMWADDIR" ]] && error "DOOMWADDIR does not exist: $DOOMWADDIR"

#=============================================================================#
#                                   MAIN                                      #
#=============================================================================#

main() {
    # define script and directory names
    local WAD_DIRS=(
        "brutalv21"
        "brutal-doom-platinum"
        "project-brutality-staging"
    )

    for WAD in "${WAD_DIRS[@]}"; do
        local WAD_PATH="$DOOMWADDIR/$WAD"
        local SCRIPT_PATH="$HOME/.my-scripts/gaming/download-${WAD}.sh"

        log "Processing: $WAD"

        # validate wad directory
        if [[ ! -d "$WAD_PATH" ]]; then
            warn "Directory not found: $WAD_PATH (skipping)"
            continue
        fi

        # validate script
        if [[ ! -f "$SCRIPT_PATH" ]]; then
            warn "Download script missing: $SCRIPT_PATH (skipping)"
            continue
        fi

        log "Using directory: $WAD_PATH"
        log "Executing: $(basename "$SCRIPT_PATH")"

        # run script in subshell to avoid cd pollution
        (
            cd "$WAD_PATH" || exit 1
            bash "$SCRIPT_PATH"
        ) || {
            warn "Execution failed for $WAD"
            continue
        }

        log "$WAD is ready. Go kill some imps 👿"
        separator
    done

    log "All WADs/PK3s installed and up to date."
    log "RIP AND TEAR 🔫"
}

main
