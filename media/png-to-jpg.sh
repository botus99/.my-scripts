#!/usr/bin/env bash

# Iterate through all PNG files in the current directory
for file in *.png; do
    # Check if the file exists
    if [ -f "$file" ]; then
        # Convert PNG to JPG using ImageMagick
        convert "$file" "${file%.png}.jpg"
    fi
done

echo "Conversion complete!"
