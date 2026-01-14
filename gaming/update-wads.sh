#!/usr/bin/env bash

# This is my over-engineered script to download the newest versions of my favorite doom wads.
# It relies on other scripts located in this directory. Note the SCRIPT_PATH location.
# If you do not have a DOOMWADDIR set up, it would be better in your bashrc, profile, /etc/environment, or similar.
#
# idea for later : make `󰳳` the progress character for wget commands

# Set strict mode
set -euo pipefail

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Function to display colored messages
print_message() {
    case "$1" in
        "ERROR") echo -e "🤭 ${RED}$2${RESET}" ;;
        "SUCCESS") echo -e "${GREEN}$2${RESET}" ;;
        "INFO") echo -e "🤓 ${YELLOW}$2${RESET}" ;;
        *) echo "$2" ;;
    esac
}

# Main function
main() {
    # Define script and directory names
    local WAD_DIRS=(
        "brutalv21"
        "brutal-doom-platinum"
        "project-brutality-staging"
    )

    # Launch download scripts for each WAD_DIRS entry
    for WAD in "${WAD_DIRS[@]}"; do

        # Go into wad directory before executing download script
        cd "$DOOMWADDIR/$WAD" || { print_message "ERROR" "Failed to change directory to $WAD"; return 1; }
        print_message "INFO" "Changing to directory: $WAD"

        # Look for download script
        SCRIPT_PATH="$HOME/.my-scripts/gaming/download-${WAD}.sh"
        if [ ! -f "$SCRIPT_PATH" ]; then
            print_message "ERROR" "Script not found: $SCRIPT_PATH"
            continue
        fi

        # Execute WAD_DIRS download scripts
        print_message "INFO" "Executing script for $WAD"
        bash "$SCRIPT_PATH" || { print_message "ERROR" "Execution failed for $WAD"; return 1; }

        # Success message
        print_message "SUCCESS" "👿 $WAD is ready. Go kill some imps"
    done

    # Success message
    print_message "SUCCESS" "✅ WADs/PK3s downloaded successfully!"
    print_message "SUCCESS" "🔫 RIP AND TEAR!!!"
}

# Run the main function
main
