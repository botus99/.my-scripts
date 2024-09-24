#!/usr/bin/env python3
import os
import subprocess

# ANSI escape codes for text colors
COLOR_GREEN = '\033[92m'
COLOR_RED = '\033[91m'
COLOR_RESET = '\033[0m'

def process_jpeg_file(jpeg_file):
    # Construct the command to run jpegoptim
    command = ['jpegoptim', '--max=80', '--strip-all', jpeg_file]

    # Run the command using subprocess
    try:
        subprocess.run(command, check=True)
        print(f"{COLOR_GREEN}Optimized{COLOR_RESET}: {jpeg_file}")
    except subprocess.CalledProcessError as e:
        print(f"{COLOR_RED}Error optimizing{COLOR_RESET}: {jpeg_file} - {e}")

def process_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.lower().endswith(('.jpg', '.jpeg')):
                jpeg_file = os.path.join(root, file)
                process_jpeg_file(jpeg_file)

# Get the current directory
current_directory = os.getcwd()

# Recursively process JPEG files in the current directory
process_directory(current_directory)
