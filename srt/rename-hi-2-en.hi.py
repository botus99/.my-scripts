#! /usr/bin/env python3
import os

def rename_files():
    directory = os.getcwd()  # Get the current working directory
    for filename in os.listdir(directory):
        if filename.endswith('.hi.srt'):
            new_filename = filename.replace('.hi.srt', '.en.hi.srt')
            old_path = os.path.join(directory, filename)
            new_path = os.path.join(directory, new_filename)
            os.rename(old_path, new_path)
            print(f"Renamed '{filename}' to '{new_filename}'")

# Call the function to rename the files in the current directory
rename_files()
