#!/usr/bin/env bash

# If the user provides a directory as the first argument, use that.
# Otherwise, define the directory to search for media files below.
MEDIA_DIR="${1:-/path/to/media/folder/}"

# Set colors for fzf
COLOR_OPTS="bg+:0,fg:15,fg+:9,border:8,hl+:2,prompt:15,hl:2,pointer:1,info:8,spinner:1"

# Create centered header
LABEL=$(echo "media launcher mf")

# Check if the user passed the '-h' or the '--help' flag. If so, display usage instructions.
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo -e "\033[92mMedia launcher with mpv using find & fzf.\033[0m" 
    echo -e "-----------------------------------------"
    echo -e "mlmf ($LABEL) searches and plays media from a specified directory"
    echo -e "using the 'find' command for file discovery, 'fzf' for interactive searching,"
    echo -e "and 'mpv' for playing the selected media file(s). A predefined directory" 
    echo -e "(specified in \033[95m$0\033[0m) will be used unless a user-specified" 
    echo -e "directory is passed as a command-line argument." 
    echo -e ""
    echo -e "\033[92mUsage:\033[0m \033[91mmlmf\033[0m \033[94m[MEDIA_DIR]\033[0m" 
    echo -e "  \033[94mMEDIA_DIR:\033[0m The directory to search for media. Defaults to a configured directory"
    echo -e "             (specified in \033[95m$0\033[0m) if not specified."
    echo -e ""
    echo -e "\033[92mAvailable options:\033[0m" 
    echo -e "  -h, --help                Show this help text"
    exit 0
fi

# Check for needed dependencies
check_dependencies() {
    local DEPENDS=(find fzf mpv)
    for DEP in "${DEPENDS[@]}"; do
        if ! command -v "$DEP" &> /dev/null; then
            echo "Error: $DEP is not installed. Please install it and try again."
            echo "For Ubuntu/Debian: sudo apt-get install $DEP"
            echo "For macOS: brew install $DEP"
            exit 1
        fi
    done
}
check_dependencies

# Check if the specified directory exists.
# If the directory does not exist, display an error message and terminate the script.
if [[ ! -d "$MEDIA_DIR" ]]; then
    echo "Error: Directory '$MEDIA_DIR' does not exist."
    echo "Please edit the MEDIA_DIR variable in $0 and try again"
    exit 1
fi

# Use 'find' to list all media files, filter with 'fzf', and play the selected file with 'mpv'
# Step 1: Use the 'find' command to locate media files in the directory.
find "$MEDIA_DIR" -type f \( -name "*.mkv" -o -name "*.mp4" -o -name "*.mpg" -o -name "*.mpeg" -o -name "*.avi" -o -name "*.mov" -o -name "*.flv" -o -name "*.mp3" -o -name "*.aac" -o -name "*.flac" -o -name "*.ogg" -o -name "*.opus" \) -printf '%P\n' | \
    # Step 2: Pipe the output of 'find' to 'fzf'.
    fzf --layout=reverse --exact --prompt=" " --no-sort --margin=1% --gap=1 --multi --color="$COLOR_OPTS" --border --border=bold --border=rounded --border-label=" $LABEL " --highlight-line --pointer " " | \
    # Step 3: Pass the selected file(s) to 'xargs', which executes the 'mpv' command for each selection.
    xargs -r -d '\n' -I {} mpv --ontop --ontop-level=system --fullscreen "$MEDIA_DIR{}"
    # alternate media player launchers to swap out if desired
    #xargs -r -d '\n' -I {} vlc --fullscreen "$MEDIA_DIR{}"
    #xargs -r -d '\n' -I {} xdg-open "$MEDIA_DIR{}"
    
# Exit after successfully playing media
exit 0
