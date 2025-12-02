#!/usr/bin/env bash

# Function to remove subtitles from movie files
remove_subtitles() {
    local input_folder="$1"
    
    for filename in "$input_folder"/*; do
        if [[ "$filename" =~ \.(wmv|avi|mpg|mpeg|mkv|mp4|m4v|flv|mov|webm)$ ]]; then
            input_path="$filename"
            output_path="${filename%.*}--no-subs.mkv"

            mkvmerge -o "$output_path" --no-subtitles "$input_path"
        fi
    done
}

# Main execution
input_folder="." # You can replace "." with the path to your movie files folder
remove_subtitles "$input_folder"
echo "Subtitles removed successfully. Press Enter to exit."
read
