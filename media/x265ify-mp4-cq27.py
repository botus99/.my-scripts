#!/usr/bin/env python3
import os
import subprocess

# Define the list of video file extensions to consider
video_extensions = (".wmv", ".avi", ".mpg", ".mpeg", ".mkv", ".m4v", ".flv", ".mov", ".webm")

# Iterate through files in the current directory
for filename in os.listdir():
    # Check if the file has a video extension
    if filename.lower().endswith(video_extensions):
        # Set input and output file names
        input_file = filename
        output_file = f"{os.path.splitext(filename)[0]}[x265]-NoGRP.mp4"

        # FFmpeg command with various flags for video conversion
        x265ify = [
            "ffmpeg",
            "-hide_banner",          # Hide banner information
            "-hwaccel", "auto",      # Automatically choose hardware acceleration
            "-i", input_file,        # Input file
            "-map", "0:v",           # Map video stream from input
            "-map", "0:a",           # Map audio stream from input
            "-map_chapters", "0",    # Map chapters from input
            "-pix_fmt", "p010le",    # Set pixel format to p010le
            "-gpu", "any",           # Use any available GPU
            "-profile:v", "main10",  # Set video profile to main10
            "-speed", "veryslow",    # Set encoding speed to very slow
            "-c:v", "hevc_nvenc",    # Set video codec to HEVC with NVIDIA NVENC
            "-preset:v", "p7",       # Set encoding preset to p7
            "-tune:v", "hq",         # Set video tuning to high quality
            "-bf", "5",              # Set the number of B-frames to 5
            "-c:a", "aac",           # Set audio codec to AAC
            "-ac", "2",              # Set number of audio channels to 2
            "-q:a", "0.75",          # Set audio quality to 0.75 (roughly 160kbps)
            "-rc-lookahead", "32",   # Set rate control lookahead to 32 frames
            "-qmin", "1",            # Set maximum video quality to 1
            "-qmax", "51",           # Set minimum video quality to 51
            "-cq", "27",             # Set constant quality value to 27 (roughly 1.5mbps-2.5mbps)
            # "-vf", "bwdif",        # Uncomment for frame-doubling bob de-interlacing
            # "-vf", "yadif=1",      # Uncomment for frame-doubling yadif de-interlacing
            # "-vf", "fieldmatch,decimate,fps=24000/1001"    # Uncomment for converting 29.97fps (TV) to 23.976fps (film) 
                                     # some common video filters: hqdn3d, deblock, deband (add after deinterlacing if using these)
            "-movflags", "+faststart",  # Enable faststart for quicker streaming
            output_file

        ]
        # Run the FFmpeg command using subprocess
        subprocess.run(x265ify, shell=True)

# Keep the window open until user presses Enter after script execution
input("Press Enter to continue...")
