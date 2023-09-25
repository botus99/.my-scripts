import os

# Get current working directory
current_dir = os.getcwd()

# Get the list of contents in the current directory
contents = os.listdir(current_dir)

# Create a file named DirContent.txt and write the list of contents into it
with open("DirContent.txt", "w") as file:
    for item in contents:
        file.write(item + "\n")

print("Directory contents have been successfully written to DirContent.txt file.")
