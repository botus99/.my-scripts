import os
import subprocess

# ANSI escape codes for text colors
COLOR_GREEN = '\033[92m'
COLOR_RED = '\033[91m'
COLOR_RESET = '\033[0m'

def process_png_file(png_file):
    # Construct the command to run optipng
    command = ['oxipng', png_file]

    # Run the command using subprocess
    try:
        subprocess.run(command, check=True)
        print(f"{COLOR_GREEN}Optimized{COLOR_RESET}: {png_file}")
    except subprocess.CalledProcessError as e:
        print(f"{COLOR_RED}Error optimizing{COLOR_RESET}: {png_file} - {e}")

def process_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.png'):
                png_file = os.path.join(root, file)
                process_png_file(png_file)

# Get the current directory
current_directory = os.getcwd()

# Process PNG files in the current directory
process_directory(current_directory)
