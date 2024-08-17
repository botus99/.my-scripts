#! /usr/bin/env python3
import os
import shutil
import subprocess

def search_interlaced_videos(target_folder):
    if not os.path.exists(target_folder):
        os.makedirs(target_folder)
        
    current_directory = os.getcwd()
    
    for root, dirs, files in os.walk(current_directory):
        for file in files:
            file_path = os.path.join(root, file)
            if file.endswith((".avi", ".mpg", ".mpeg", ".mp4", ".mkv")):
                if is_interlaced(file_path):
                    destination_path = os.path.join(target_folder, file)
                    shutil.move(file_path, destination_path)
                    print(f"Moved interlaced video: {file}")

def is_interlaced(video_path):
    mediainfo_cmd = ['mediainfo', '--Output=Video;%ScanType%', video_path]
    try:
        output = subprocess.check_output(mediainfo_cmd, stderr=subprocess.DEVNULL, universal_newlines=True)
        if 'Interlaced' in output:
            return True
    except subprocess.CalledProcessError as e:
        print(f"MediaInfo error: {e}")
    
    return False

# Example usage
search_interlaced_videos("interlaced")
