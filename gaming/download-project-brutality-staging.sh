#!/usr/bin/env bash

# Exit the script immediately if any command fails
set -euo pipefail

#=============================================================================#
#                                   CONFIG                                    #
#=============================================================================#

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

log()    { echo -e "${GREEN}[INFO]${RESET} $1"; }
warn()   { echo -e "${YELLOW}[WARN]${RESET} $1"; }
error()  { echo -e "${RED}[ERROR]${RESET} $1"; exit 1; }

#=============================================================================#
#                              ASCII HEADER (CENTERED)                        #
#=============================================================================#

print_centered() {
    local TERM_WIDTH
    TERM_WIDTH=$(tput cols)

    while IFS= read -r LINE; do
        # strip ANSI color codes for length calculation
        local CLEAN_LINE
        CLEAN_LINE=$(echo -e "$LINE" | sed 's/\x1b\[[0-9;]*m//g')

        local LINE_LENGTH=${#CLEAN_LINE}
        local PADDING=$(( (TERM_WIDTH - LINE_LENGTH) / 2 ))

        printf "%*s%s\n" "$PADDING" "" "$LINE"
    done
}

print_centered << "EOF"
             ██████╗  ██████╗  ██╗   ██╗ ████████╗  █████╗  ██╗                
             ██╔══██╗ ██╔══██╗ ██║   ██║ ╚══██╔══╝ ██╔══██╗ ██║                
             ██████╔╝ ██████╔╝ ██║   ██║    ██║    ███████║ ██║                
             ██╔══██╗ ██╔══██╗ ██║   ██║    ██║    ██╔══██║ ██║                
             ██████╔╝ ██║  ██║ ╚██████╔╝    ██║    ██║  ██║ ███████╗           
             ╚═════╝  ╚═╝  ╚═╝  ╚═════╝     ╚═╝    ╚═╝  ╚═╝ ╚══════╝           

    ▓   ▓ ▓▓▓        ▓  ▓ ▓▓▓  ▓        ▓      ▓ ▓░   ░░▓  ▓▓    ▓  ▓▓         
  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ░▓▓▓░▓▓▓▓▓▓▓▓░▓▒ ░░▓▓▓▓░▓▓▓▓░▓▓▓▓▓▓▓▓░▓▓▓▓░   ▓▓▓▓▓▓▓▓  
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓  ▓▓▓▓▓░▓▓  
    ▓▓▓▓▓▓▓░ ▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓ ▓▓▓▓▓▓▓▓  
    ▓▓▓▓▓▓▒    ▓▓▓▓▒▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓  
    ▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓░▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  
    ▓▓▓▓▓▓▓    ▓▓▒▓▓░▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓░ ▓░▓▓▓▓░    ▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓▓▓▓▓▓░░▓▓▓  
    ▓▓▓▓░▓▓    ▓▓▓░▓▓░▓▓▓▓▓░▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░  
    ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  
    ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░  
    ▓▓▓▓░▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  
    ▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓ ▓▓▓▓▓ ▓▓▓▓▓▓░    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  
    ▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓ ▓▓▓▓▓▓░  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  
    ▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ▓▓░▓▓▓▓▓▓▓  
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓  ▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓ ▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓  ▓▓▓▓░▓▓ ░▓ ▓▓▓▓▓▓▓  
    ▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓░       ▓░▓▓▓▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓▓▓▓▓▓       ▓░▓▓▓    ▓▓▓▓▓▓▓  
    ▓▓▓▓ ▓▓▓▓▓▓▓▓            ▓▓▓▓▓▓▓▓▓    ▓▓▓▓░▒▓▓▓▓            ▓▓    ▓▓▓░░▓▓  
    ▓▓▓▓▓▓ ▓▓░                  ░▓▓░         ▓▓░▓                     ▓▓▓▓▓▓▓  
    ▓▓▓▓▓▓▓▓                                                          ░▓▓▓▓▓▓  
    ▓▓▓▓▓                                                               ▓▓▓░░  
    ░▓▓                                                                   ▒▓▓  

       ██████╗  ██████╗   ██████╗       ██╗ ███████╗  ██████╗ ████████╗        
       ██╔══██╗ ██╔══██╗ ██╔═══██╗      ██║ ██╔════╝ ██╔════╝ ╚══██╔══╝        
       ██████╔╝ ██████╔╝ ██║   ██║      ██║ █████╗   ██║         ██║           
       ██╔═══╝  ██╔══██╗ ██║   ██║ ██   ██║ ██╔══╝   ██║         ██║           
       ██║      ██║  ██║ ╚██████╔╝ ╚█████╔╝ ███████╗ ╚██████╗    ██║           
       ╚═╝      ╚═╝  ╚═╝  ╚═════╝   ╚════╝  ╚══════╝  ╚═════╝    ╚═╝           
                                                                               
██████╗  ██████╗  ██╗   ██╗ ████████╗  █████╗  ██╗      ██╗ ████████╗ ██╗   ██╗
██╔══██╗ ██╔══██╗ ██║   ██║ ╚══██╔══╝ ██╔══██╗ ██║      ██║ ╚══██╔══╝ ╚██╗ ██╔╝
██████╔╝ ██████╔╝ ██║   ██║    ██║    ███████║ ██║      ██║    ██║     ╚████╔╝ 
██╔══██╗ ██╔══██╗ ██║   ██║    ██║    ██╔══██║ ██║      ██║    ██║      ╚██╔╝  
██████╔╝ ██║  ██║ ╚██████╔╝    ██║    ██║  ██║ ███████╗ ██║    ██║       ██║   
╚═════╝  ╚═╝  ╚═╝  ╚═════╝     ╚═╝    ╚═╝  ╚═╝ ╚══════╝ ╚═╝    ╚═╝       ╚═╝   
EOF




# Download URL
URL="https://github.com/pa1nki113r/Project_Brutality/archive/refs/heads/PB_Staging.zip"

# Output filename
FILENAME="project-brutality-staging.pk3"

# Check network connectivity
if ! ping -c 1 github.com &> /dev/null; then
    error "No internet connection. Exiting."
fi

# Download current staging build
if ! wget --no-verbose --progress=bar --show-progress --output-document="$FILENAME" "$URL"; then
    error "Download failed. Error: $?"
fi

# Check if download was successful
if [ -f "$FILENAME" ]; then
    log "Latest staging version of Project Brutality downloaded successfully."
else
    error "File not found after download. Exiting."
fi

# Extract pk3 file to temp directory
log "Extracting contents..."
unzip -q "$FILENAME" -d temp_dir

# Navigate to root of extracted pk3
log "Changing directory structure..."
cd temp_dir/Project_Brutality-PB_Staging
rm -rf .github

# Compress to pk3
log "Compressing modified contents..."
zip -q -r -9 "../../project-brutality-staging_modified.pk3" .

# Clean up and finalize things
cd ../..
rm -rf temp_dir
rm "$FILENAME"
mv project-brutality-staging_modified.pk3 "$FILENAME"

# Success message (commented out in favor of the script sourcing this script doing the echo)
#echo "Operation completed successfully."
#echo "Rip and tear!"
