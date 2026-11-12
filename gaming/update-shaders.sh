#!/usr/bin/env bash
#=============================================================================#
# name:        update-shaders.sh
# author:      botus99
# messed with: 2026-11-08
# description: download the newest versions of my favorite shader packs
#              external download scripts must live alongside this script
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

# print the physical directory containing this script, following symlinks
resolve_script_dir() {
    local SRC="${BASH_SOURCE[0]}"
    local DIR

    # follow the symlink chain until we reach the real file
    while [[ -L "$SRC" ]]; do
        DIR="$(cd -P "$(dirname "$SRC")" && pwd)"
        SRC="$(readlink "$SRC")"

        # relative link targets are relative to the link's own directory
        if [[ "$SRC" != /* ]]; then
            SRC="$DIR/$SRC"
        fi
    done

    cd -P "$(dirname "$SRC")" && pwd
}

#=============================================================================#
#                               SANITY CHECKS                                 #
#=============================================================================#

# resolve the real directory of this script, not the directory it was launched from
SCRIPT_DIR="$(resolve_script_dir)"
[[ ! -r "$SCRIPT_DIR" ]] && error "Script directory is not readable: $SCRIPT_DIR"

#=============================================================================#
#                                   MAIN                                      #
#=============================================================================#

main() {
    # define download script names (expected alongside the real script)
    local SHADER_SCRIPTS=(
        "download-retroarch-glsl-shaders.sh"
        "download-Mega_Bezel-shaders.sh"
        "download-20th-Century-Cathode-shaders.sh"
        "download-duimon-shaders.sh"
        "download-RetroCrisis-shaders.sh"
        "download-extra-duckstation-shaders.sh"
    )

    local TOTAL=${#SHADER_SCRIPTS[@]}
    local SUCCEEDED=0
    local FAILED=()

    log "Processing ${TOTAL} shader packs from ${SCRIPT_DIR}"

    for SHADER in "${SHADER_SCRIPTS[@]}"; do
        local SCRIPT_PATH="$SCRIPT_DIR/$SHADER"

        # validate download script
        if [[ ! -f "$SCRIPT_PATH" ]]; then
            warn "Download script missing: $SCRIPT_PATH (skipping)"
            FAILED+=("$SHADER (missing)")
            continue
        fi

        # capture the exit status without tripping set -e
        local RC=0
        bash "$SCRIPT_PATH" || RC=$?

        if (( RC == 0 )); then
            (( ++SUCCEEDED ))
        else
            warn "Execution failed for $SHADER (exit $RC)"
            FAILED+=("$SHADER (exit $RC)")
        fi

        separator
    done

    # report results and fail loudly if anything did not update
    if (( ${#FAILED[@]} == 0 )); then
        log "All ${TOTAL} shader packs installed and up to date."
    else
        warn "Failed shader packs:"
        printf '  - %s\n' "${FAILED[@]}"
        error "${#FAILED[@]} of ${TOTAL} shader packs did not update (${SUCCEEDED} succeeded)"
    fi
}

main
