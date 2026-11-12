#!/usr/bin/env bash
#=============================================================================#
# name:        jpegoptim-recursively
# author:      botus99
# messed with: 2026-09-24
# dep/reqs:    jpegoptim
# description: basic wrapper script for prettier output with bulk processing
#              I link this to 'jpegoptim-recursively' in my '$HOME/.local/bin'
#=============================================================================#

# ANSI escape codes for text colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'

# default values
TARGET_DIR="."
QUIET=false
COUNT=0
ERRORS=0
TOTAL_SAVINGS=0

# help function
show_help() {
    echo -e "${GREEN}jpegoptim-recursively${RESET}"
    echo -e "${YELLOW}---------------------${RESET}"
    echo -e "    Recursively optimize JPEG images in a directory using ${GREEN}jpegoptim${RESET}"
    echo

    echo -e "${YELLOW}Options:${RESET}"
    echo -e "    ${CYAN}-h, --help${RESET}             Show this help message"
    echo -e "    ${CYAN}-q, --quiet${RESET}            Suppress output messages"
    echo -e "    ${CYAN}DIRECTORY${RESET}              Target directory (default: current directory)"
    echo

    echo -e "${YELLOW}Examples:${RESET}"
    echo -e "    ${GREEN}jpegoptim-recursively${RESET}                  Optimize current directory"
    echo -e "    ${GREEN}jpegoptim-recursively${RESET} ${CYAN}/path/to/images ${RESET} Optimize specific directory"
    echo -e "    ${GREEN}jpegoptim-recursively${RESET} ${CYAN}--help${RESET}           Show this help screen"
}

# get file size in bytes (cross-platform)
get_file_size() {
    local file="$1"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        stat -f%z "$file"
    else
        stat -c%s "$file"
    fi
}

# convert bytes to human-readable format
format_bytes() {
    local bytes=$1
    if (( bytes < 1024 )); then
        echo "${bytes}B"
    elif (( bytes < 1024 * 1024 )); then
        echo "$(awk "BEGIN {printf \"%.2f\", $bytes / 1024}")KB"
    else
        echo "$(awk "BEGIN {printf \"%.2f\", $bytes / (1024 * 1024)}")MB"
    fi
}

# check if jpegoptim is installed
check_dependencies() {
    if ! command -v jpegoptim &> /dev/null; then
        echo -e "${RED}Error${RESET}: jpegoptim is not installed"
        echo "Install it with: sudo apt-get install jpegoptim  (Ubuntu/Debian)"
        echo "                 brew install jpegoptim           (macOS)"
        exit 1
    fi
}

# process a single JPEG file
process_jpeg_file() {
    local jpeg_file="$1"
    
    # get file size before optimization
    local size_before
    size_before=$(get_file_size "$jpeg_file")
    
    # run jpegoptim
    if jpegoptim --max=80 --strip-all "$jpeg_file" > /dev/null 2>&1; then
        # get file size after optimization
        local size_after
        size_after=$(get_file_size "$jpeg_file")
        
        # calculate savings
        local savings=$((size_before - size_after))
        local savings_pct=0
        if (( size_before > 0 )); then
            savings_pct=$((savings * 100 / size_before))
        fi
        
        # add to total savings
        TOTAL_SAVINGS=$((TOTAL_SAVINGS + savings))
        
        ((COUNT++))
        if [[ "$QUIET" == false ]]; then
            local savings_fmt
            savings_fmt=$(format_bytes "$savings")
            echo -e "${GREEN}Optimized${RESET}: $jpeg_file (saved ${YELLOW}${savings_fmt} (${savings_pct}%)${RESET})"
        fi
    else
        ((ERRORS++))
        [[ "$QUIET" == false ]] && echo -e "${RED}Error optimizing${RESET}: $jpeg_file"
    fi
}

# process directory recursively
process_directory() {
    local directory="$1"
    
    if [[ ! -d "$directory" ]]; then
        echo -e "${RED}Error${RESET}: Directory does not exist: $directory"
        exit 1
    fi
    
    # use find for recursive directory traversal
    while IFS= read -r -d '' jpeg_file; do
        process_jpeg_file "$jpeg_file"
    done < <(find "$directory" -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -print0)
}

# parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            show_help
            exit 0
            ;;
        -q|--quiet)
            QUIET=true
            shift
            ;;
        *)
            TARGET_DIR="$1"
            shift
            ;;
    esac
done

# main execution
check_dependencies
process_directory "$TARGET_DIR"

# summary at the end of the script
if [[ "$QUIET" == false ]]; then
    local total_savings_fmt
    total_savings_fmt=$(format_bytes "$TOTAL_SAVINGS")
    echo ""
    echo -e "Summary: ${GREEN}$COUNT optimized${RESET}, ${RED}$ERRORS errors${RESET}, ${YELLOW}Total saved: ${total_savings_fmt}${RESET}"
fi

# exit with error code if there were failures
[[ $ERRORS -gt 0 ]] && exit 1
exit 0
