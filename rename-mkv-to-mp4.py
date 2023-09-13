import os

def rename_files():
    current_directory = os.getcwd()
    for filename in os.listdir(current_directory):
        if filename.endswith(".mkv"):
            mkv_path = os.path.join(current_directory, filename)
            mp4_path = os.path.join(current_directory, filename.replace(".mkv", ".mp4"))
            os.rename(mkv_path, mp4_path)
            print(f"Renamed: {mkv_path} to {mp4_path}")

# Call the function to rename the files in the current directory
rename_files()