#! /usr/bin/env python3
import os

# Function to remove subtitles from movie files
def remove_subtitles(input_folder):
    for filename in os.listdir(input_folder):
        if filename.lower().endswith(('.wmv', '.avi', '.mpg', '.mpeg', '.mkv', '.mp4', '.m4v', '.flv', '.mov', '.webm')):
            input_path = os.path.join(input_folder, filename)
            output_path = os.path.join(input_folder, f"{os.path.splitext(filename)[0]}--no-subs.mkv")

            command = f'mkvmerge -o "{output_path}" --no-subtitles "{input_path}"'
            os.system(command)

if __name__ == "__main__":
    input_folder = "."  # You can replace "." with the path to your movie files folder
    remove_subtitles(input_folder)
    print("Subtitles removed successfully. Press Enter to exit.")
    input()
