import os

def rename_files():
    current_directory = os.getcwd()
    for filename in os.listdir(current_directory):
        if filename.endswith(".mp4"):
            mp4_path = os.path.join(current_directory, filename)
            mkv_path = os.path.join(current_directory, filename.replace(".mp4", ".mkv"))
            os.rename(mp4_path, mkv_path)
            print(f"Renamed: {mp4_path} to {mkv_path}")

# Call the function to rename the files in the current directory
rename_files()