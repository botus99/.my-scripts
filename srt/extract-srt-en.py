#! /usr/bin/env python3
import os

# Function to extract SRT subtitles from movie files
def extract_subtitles():
    # List of movie file extensions
    movie_extensions = ['.wmv', '.avi', '.mpg', '.mpeg', '.mkv', '.mp4', '.m4v', '.flv', '.mov', '.webm']
    
    # Iterate through files in the current directory
    for filename in os.listdir('.'):
        # Check if the file has a movie extension
        if any(filename.lower().endswith(ext) for ext in movie_extensions):
            # Extract subtitles using mkvextract (assuming mkvtoolnix is installed)
            os.system(f'mkvextract tracks "{filename}" 2:"{os.path.splitext(filename)[0]}.en.srt"')

# Execute the function
extract_subtitles()
