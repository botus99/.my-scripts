import os
import subprocess

# Get the current working directory
current_directory = os.getcwd()

# Loop through files in the current directory
for filename in os.listdir(current_directory):
    if filename.endswith((".wmv", ".avi", ".mpg", ".mpeg", ".mkv", ".mp4", ".m4v", ".flv", ".mov", ".webm")):
        input_filepath = os.path.join(current_directory, filename)
        output_filepath = os.path.splitext(input_filepath)[0] + ".en.hi.srt"
        
        # Run mkvextract using subprocess. 
        # track 2 is typically english
        subprocess.run(["mkvextract", "tracks", input_filepath, "3:" + output_filepath])

print("English (hearing impaired) subtitles extracted.")