import os

# Get the current directory
directory = os.getcwd()

# Get a list of all files in the directory
files = os.listdir(directory)

# Iterate over the files
for file in files:
    if file.endswith('.zip') and '!' not in file:
        file_path = os.path.join(directory, file)
        os.remove(file_path)
        print(f"Deleted: {file}")