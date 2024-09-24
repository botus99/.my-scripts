#!/usr/bin/env python3
import os

def format_size(size):
    # Format file size in a human-readable format
    suffixes = ['B', 'KB', 'MB', 'GB', 'TB']
    index = 0
    while size >= 1024 and index < len(suffixes)-1:
        size /= 1024
        index += 1
    return f"{size:.2f} {suffixes[index]}"

def format_permissions(mode):
    # Format file permissions to string representation
    permissions = {
        0o400: "r", 0o200: "w", 0o100: "x",
        0o040: "r", 0o020: "w", 0o010: "x",
        0o004: "r", 0o002: "w", 0o001: "x"
    }
    p_str = ""
    for octal, symbol in permissions.items():
        p_str += symbol if mode & octal else "-"
    return p_str

def format_directory_listing(directory, indent=""):
    files = os.listdir(directory)
    files.sort(key=lambda x: x.casefold())  # Sort filenames case-insensitively
    listing = []
    for file in files:
        filepath = os.path.join(directory, file)
        mode = os.stat(filepath).st_mode
        size = os.stat(filepath).st_size
        timestamp = os.path.getmtime(filepath)
        permissions = format_permissions(mode)
        formatted_size = format_size(size)
        formatted_timestamp = f"{timestamp:.0f}"
        listing.append(f"{indent}{permissions}  {formatted_size}\t{file}")
        if os.path.isdir(filepath):
            sub_listing = format_directory_listing(filepath, indent + "    ")
            listing.extend(sub_listing)
    return listing

def save_directory_listing(directory, filename):
    listing = format_directory_listing(directory)
    with open(filename, 'w') as file:
        file.writelines('\n'.join(listing))

directory = os.getcwd()  # Get the current working directory path
filename = "DirContent-pretty.txt"

save_directory_listing(directory, filename)

print("Directory contents have been successfully written to DirContent-pretty.txt file.")
