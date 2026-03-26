#!/usr/bin/env bash
#
# download later
# sometimes you have a download link, but your network is already busy with something else
# enter the link, enter when to download, let the script do the rest


# strict mode
set -euo pipefail

# if the user presses Ctrl+C, exit cleanly.
trap 'echo -e "\nCancelled."; exit 1' INT

########################################
# colors
########################################

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'

info() {
    echo -e "${BLUE}[INFO]${RESET} $*"
}

warn() {
    echo -e "${YELLOW}[WARN]${RESET} $*"
}

error() {
    echo -e "${RED}[ERROR]${RESET} $*"
}

success() {
    echo -e "${GREEN}[SUCCESS]${RESET} $*"
}

########################################
# logging
########################################

LOG_DIR="$HOME/.local/share/dll"
LOG_FILE="$LOG_DIR/dll.log"

mkdir -p "$LOG_DIR"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') | $*" >> "$LOG_FILE"
}

########################################
# help / usage
########################################

usage() {
    echo -e "${GREEN}dll${RESET}"
    echo -e "${YELLOW}---${RESET}"
    echo -e "    Download a file later"
    echo -e "    Using ${GREEN}aria2${RESET} or ${GREEN}yt-dlp${RESET}, ${GREEN}dll${RESET} automatically selects a downloader"
    echo -e "    Downloads are made in whichever directory you run the script from"
    echo

    echo -e "${YELLOW}Usage:${RESET}"
    echo -e "    ${GREEN}dll${RESET} ${CYAN}-u${RESET} <URL> ${CYAN}-t${RESET} <TIME> ${CYAN}--daemon${RESET}"
    echo

    echo -e "${YELLOW}Options:${RESET}"
    echo -e "    ${CYAN}-u, --url${RESET} <URL>        Download link"
    echo -e "    ${CYAN}-t, --time${RESET} <TIME>      When to start download"
    echo -e "    ${CYAN}-d, --daemon${RESET}           Run download scheduler in background"
    echo -e "    ${CYAN}-h, --help${RESET}             Show this help message"
    echo

    echo -e "${YELLOW}Time formats:${RESET}"
    echo -e "    ${BLUE}HH:MM${RESET}                  absolute time (24-hour clock)"
    echo -e "    ${BLUE}10s${RESET}                    10 seconds from now"
    echo -e "    ${BLUE}5m${RESET}                     5 minutes from now"
    echo -e "    ${BLUE}2h${RESET}                     2 hours from now"
    echo

    echo -e "${YELLOW}Examples:${RESET}"
    echo -e "    ${GREEN}dll${RESET} ${CYAN}-u${RESET} ${BLUE}https://example.com/file.zip${RESET} ${CYAN}-t${RESET} 17:45"
    echo -e "    ${GREEN}dll${RESET} ${CYAN}-u${RESET} ${BLUE}https://example.com/file.zip${RESET} ${CYAN}-t${RESET} 10m"
    echo -e "    ${GREEN}dll${RESET} ${CYAN}-u${RESET} ${BLUE}https://youtube.com/watch?v=abc${RESET} ${CYAN}-t${RESET} 30m ${CYAN}--daemon${RESET}"
}

########################################
# dependencies
########################################

check_dependencies() {
    if ! command -v aria2c >/dev/null 2>&1; then
        error "aria2 is not installed."
        exit 1
    fi

    if ! command -v date >/dev/null 2>&1; then
        error "'date' command not found."
        exit 1
    fi
}

########################################
# detect date
########################################

detect_date_variant() {
    if date --version >/dev/null 2>&1; then
        DATE_TYPE="gnu"
    else
        DATE_TYPE="bsd"
    fi
}

########################################
# detect youtube
########################################

is_youtube() {
    [[ "$1" =~ youtube\.com|youtu\.be|invidious\.nerdvpn\.de|inv\.nadeko\.net|yewtu\.be ]]
}

########################################
# convert HH:MM to seconds from now
########################################

absolute_time_to_seconds() {
    local input="$1"
    local current_epoch
    local target_epoch

    current_epoch=$(date +%s)

    if [[ "$DATE_TYPE" == "gnu" ]]; then
        target_epoch=$(date -d "$(date +%F) $input" +%s)
    else
        target_epoch=$(date -j -f "%Y-%m-%d %H:%M" "$(date +%F) $input" +%s)
    fi

    local diff=$((target_epoch - current_epoch))

    if (( diff < 0 )); then
        diff=$((diff + 86400))
    fi

    echo "$diff"
}

########################################
# convert relative time to seconds
########################################

relative_time_to_seconds() {
    local input="$1"

    if [[ "$input" =~ ^([0-9]+)s$ ]]; then
        echo "${BASH_REMATCH[1]}"

    elif [[ "$input" =~ ^([0-9]+)m$ ]]; then
        echo "$(( ${BASH_REMATCH[1]} * 60 ))"

    elif [[ "$input" =~ ^([0-9]+)h$ ]]; then
        echo "$(( ${BASH_REMATCH[1]} * 3600 ))"

    else
        error "Invalid relative time format."
        exit 1
    fi
}

########################################
# determine delay from user input
########################################

calculate_delay() {
    local input="$1"

    if [[ "$input" =~ ^[0-9]+[smh]$ ]]; then
        relative_time_to_seconds "$input"

    elif [[ "$input" =~ ^([01]?[0-9]|2[0-3]):[0-5][0-9]$ ]]; then
        absolute_time_to_seconds "$input"

    else
        error "Invalid time format."
        exit 1
    fi
}

########################################
# countdown timer
########################################

countdown() {
    local seconds="$1"

    info "Waiting..."

    while (( seconds > 0 )); do
        printf "\rStarting download in %d seconds..." "$seconds"
        sleep 1
        ((seconds--))
    done

    echo
}

########################################
# download with aria2 or yt-dlp
########################################

download_file() {
    local url="$1"

    log "Starting download: $url"

    if is_youtube "$url"; then
        if ! command -v yt-dlp >/dev/null 2>&1; then
            error "yt-dlp required for YouTube downloads."
            exit 1
        fi

        info "Detected YouTube link. Using yt-dlp."

        yt-dlp \
            -f "bestvideo+bestaudio/best" \
            --merge-output-format mp4 \
            "$url"
    else
        info "Using aria2 to download."

        aria2c \
            --continue=true \
            --max-connection-per-server=16 \
            --split=16 \
            --min-split-size=1M \
            --summary-interval=5 \
            "$url"
    fi

    log "Download finished: $url"
}

########################################
# parse cli arguments
########################################

download_link=""
download_time=""
daemon_mode=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        -u|--url)
            download_link="$2"
            shift 2
            ;;
        -t|--time)
            download_time="$2"
            shift 2
            ;;
        -d|--daemon)
            daemon_mode=true
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            error "Unknown argument: $1"
            exit 1
            ;;
    esac
done

########################################
# prompts
########################################

if [[ -z "$download_link" ]]; then
    read -r -p "Enter download link: " download_link
fi

if [[ -z "$download_time" ]]; then
    read -r -p "Enter when to download (HH:MM, 10m, 2h, etc): " download_time
fi

########################################
# main program
########################################

check_dependencies
detect_date_variant

delay_seconds=$(calculate_delay "$download_time")

info "Download scheduled in $delay_seconds seconds."
log "Scheduled download: $download_link in $delay_seconds seconds"

########################################
# daemon mode
########################################

if $daemon_mode; then
    info "Running in daemon mode."

    (
        sleep "$delay_seconds"
        download_file "$download_link"
        success "Download completed!"
    ) &

    info "Background job started (PID $!)"
    log "Daemon job started (PID $!)"

    exit 0

else
    countdown "$delay_seconds"
    download_file "$download_link"
    success "Download completed!"
fi
