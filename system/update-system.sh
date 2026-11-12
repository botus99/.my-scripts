#!/usr/bin/env bash
# =========================================================================== #
# Name:        update-system.sh
# Author:      botus99
# Updated:     2026-05-05
# Description: over-engineered debian-based system updater
#              skip a package manager with --skip flag
#              log to '~/.local/share/system-updates/'
# =========================================================================== #
set -u
set -o pipefail
shopt -s nullglob

# =========================================================================== #
#                                   COLORS                                    #
# =========================================================================== #
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
CYAN="\033[1;36m"
RESET="\033[0m"

# =========================================================================== #
#                                   LOGGING                                   #
# =========================================================================== #
LOG_DIR="$HOME/.local/share/system-updates"
mkdir -p "$LOG_DIR"
RUN_TIMESTAMP="$(date +"%Y-%m-%d_%H-%M-%S")"
LOG_FILE="$LOG_DIR/update-$RUN_TIMESTAMP.log"

timestamp() {
    date +"%Y-%m-%d %H:%M:%S"
}

log() {
    echo "[$(timestamp)] $1" >> "$LOG_FILE"
}

# prune old logs (keep newest 30)
prune_logs() {
        mapfile -t old_logs < <(
            ls -1t "$LOG_DIR"/update-*.log 2>/dev/null | tail -n +31
            # find "$LOG_DIR" -maxdepth 1 -name 'update-*.log' -type f -printf '%T@ %p\n' \
            #     | sort -nr \
            #     | awk 'NR>30 {sub(/^[^ ]+ /,""); print}'
        )
        if (( ${#old_logs[@]} > 0 )); then
            command rm -f -- "${old_logs[@]}"
        fi
}
prune_logs

# =========================================================================== #
#                                   HEADERS                                   #
# =========================================================================== #
banner() {
    local NAME="$1"
    local COLOR="${2:-$BLUE}"
    local COLS
    COLS=$(tput cols 2>/dev/null || echo 80)

    local LINE
    LINE=$(printf '%*s' "$COLS" '' | tr ' ' '=')

    local TEXT=" $NAME "
    local TEXT_LENGTH=${#TEXT}
    local PAD=$(( (COLS - TEXT_LENGTH) / 2 ))
    (( PAD < 0 )) && PAD=0

    printf "%b\n" "${COLOR}${LINE}${RESET}"
    printf "%b%*s%s%*s%b\n" \
        "$COLOR" "$PAD" '' "$TEXT" "$PAD" '' "$RESET"
    printf "%b\n" "${COLOR}${LINE}${RESET}"
}

# =========================================================================== #
#                              CASE-INSENSITIVITY                             #
# =========================================================================== #
normalize() {
    printf '%s' "$1" | tr '[:upper:]' '[:lower:]'
}

# =========================================================================== #
#                                 SKIP FLAGS                                  #
# =========================================================================== #
skip_terms=()
while [[ $# -gt 0 ]]; do
       case "$1" in
           --skip)
               shift
               if [[ -z "$1" || "$1" == --* ]]; then
                   echo -e "${RED}Error: --skip requires an argument${RESET}"
                   return 1
               fi
               skip_terms+=("$(normalize "$1")")
               ;;
           *)
               echo -e "${YELLOW}Unknown option: $1${RESET}"
               ;;
       esac
       shift
done

# =========================================================================== #
#                               KEEP SUDO ALIVE                               #
# =========================================================================== #
# ask once upfront
sudo -v || exit 1

# keep sudo alive in background
(
while true; do
    sudo -n true
    sleep 60
done
) 2>/dev/null &
SUDO_PID=$!

# ensure background sudo loop dies on exit
trap 'kill $SUDO_PID 2>/dev/null || true' EXIT

# =========================================================================== #
#                                  COUNTERS                                   #
# =========================================================================== #
success_count=0
failure_count=0
skipped_count=0

# =========================================================================== #
#                          ORDERED STRUCTURED TUPLES                          #
#                            "LABEL|COLOR|COMMAND"                            #
# =========================================================================== #
tasks=(
 "Debian|$CYAN|sudo nala upgrade -y"
 "Deb-Get|$CYAN|$HOME/.local/bin/update-deb-get"
 "Pacstall|$CYAN|pacstall -Up"
 "Flatpak|$CYAN|flatpak update -y"
 "AppImages|$CYAN|gearlever --update --all -y"
 "Python|$CYAN|pipx upgrade-all"
 "Cargo|$CYAN|cargo-install-update install-update --all"
 "TLDR|$CYAN|tldr -u"
 "TGPT|$CYAN|sudo tgpt -u"
 "Doom WADs|$CYAN|$HOME/.local/bin/update-wads"
 "Shaders|$CYAN|$HOME/.local/bin/update-shaders"
 "Portainer|$CYAN|$HOME/update-portainer.sh"
 "Docker containers|$CYAN|$HOME/update-docker-containers.sh"
 "Cleanup|$CYAN|sudo nala autoremove && sudo nala clean"
)

log "  :: update run started --------"

# =========================================================================== #
#                              EXECUTE IN ORDER                               #
# =========================================================================== #
for task in "${tasks[@]}"; do
    IFS='|' read -r LABEL COLOR COMMAND <<< "$task"
    label_lc=$(normalize "$LABEL")
    should_skip=false

# skip check
for term in "${skip_terms[@]}"; do
    if [[ "$label_lc" == *"$term"* ]]; then
        should_skip=true
        break
    fi
done

# command exists check (ignore sudo)
CMD_NAME=$(sed -E 's/^sudo[[:space:]]+//' <<< "$COMMAND" | awk '{print $1}')
if ! command -v "$CMD_NAME" >/dev/null 2>&1; then
    echo -e "${YELLOW}⏭ Skipping $LABEL (command $CMD_NAME not found)${RESET}"
    log "[SKIPPED]: $LABEL (command $CMD_NAME not found)"
    ((skipped_count++))
    continue
fi

# skip if your supposed to skip
if $should_skip; then
    ((skipped_count++))
    echo -e "${YELLOW}⏭ Skipping $LABEL${RESET}"
    log "[SKIPPED]: $LABEL"
    continue
fi

# =========================================================================== #
#                                PRINT BANNERS                                #
# =========================================================================== #
banner "$LABEL" "$COLOR"
log "[START]: $LABEL"

# run command and strip ANSI before writing to log
bash -c "$COMMAND" 2>&1 | tee >(sed -E 's/\x1B\[[0-9;]*[mK]//g' >> "$LOG_FILE")

# =========================================================================== #
#                                FINAL CHECKS                                 #
# =========================================================================== #
CMD_STATUS=${PIPESTATUS[0]}
    if [[ $CMD_STATUS -eq 0 ]]; then
        ((success_count++))
        log "[SUCCESS]: $LABEL"
    else
        ((failure_count++))
        log "[FAILURE]: $LABEL"
        echo -e "${RED}⚠️ $LABEL failed — continuing...${RESET}"
    fi
done

# =========================================================================== #
#                                FINAL SUMMARY                                #
# =========================================================================== #
log "  :: update run finished --------"
log "[SUCCESS]: $success_count | [FAILURE]: $failure_count | [SKIPPED]: $skipped_count"
banner "All done!" "$GREEN"

echo -e "${GREEN}✅ SUCCESS: $success_count${RESET}"
echo -e "${RED}❌ FAILURE: $failure_count${RESET}"
echo -e "${YELLOW}👋 SKIPPED: $skipped_count${RESET}"
echo -e "📄 log file: $LOG_FILE"

# =========================================================================== #
#                                NOTIFICATION                                 #
# =========================================================================== #
# bypass notification if no display is detected
if command -v notify-send >/dev/null 2>&1 && [[ -n "$DISPLAY" ]]; then
    notify-send "System Update Complete" \
    "Success: $success_count  Failure: $failure_count  Skipped: $skipped_count"
fi
