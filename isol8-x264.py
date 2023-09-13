import os
import shutil

def search_and_move_x264_videos(folder_path, destination_folder):
    # Create the 'x264' folder if it doesn't exist
    if not os.path.exists(destination_folder):
        os.makedirs(destination_folder)

    # Iterate over all files in the specified folder
    for filename in os.listdir(folder_path):
        file_path = os.path.join(folder_path, filename)
        
        # Check if the file is a video and encoded with x264 / AVC
        if os.path.isfile(file_path) and filename.lower().endswith(('.mp4', '.mkv', '.avi')):
            try:
                output = os.popen(f'ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "{file_path}"').read().strip()
                if output.lower() == 'h264' or output.lower() == 'avc':
                    # Move the x264 / AVC encoded video to the 'x264' folder
                    destination_path = os.path.join(destination_folder, filename)
                    shutil.move(file_path, destination_path)
                    print(f"Moved '{filename}' to '{destination_folder}'")
            except:
                pass

# Specify the folder path to search for videos
folder_to_search = os.getcwd()

# Specify the destination folder for x264 / AVC encoded videos
destination_folder = os.path.join(os.getcwd(), 'x264')

# Call the function to search and move x264 / AVC encoded videos
search_and_move_x264_videos(folder_to_search, destination_folder)
