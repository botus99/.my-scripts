#! /usr/bin/env python3
import os

def rename_files(directory):
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        
        if os.path.isdir(file_path):
            rename_files(file_path)  # Recursively call the function for subdirectories
        elif filename.endswith('.hi.srt') and '.en.hi.srt' not in filename:
            new_filename = filename.replace('.hi.srt', '.en.hi.srt')
            new_path = os.path.join(directory, new_filename)
            
            os.rename(file_path, new_path)
            print(f"Renamed '{filename}' to '{new_filename}'")

# Call the function with the root directory where you want to start the renaming process
root_directory = os.getcwd()  # You can set this to any directory
rename_files(root_directory)
