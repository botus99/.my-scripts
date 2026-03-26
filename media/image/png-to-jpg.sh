#!/usr/bin/env bash

# iterate through all png files in current directory
for file in *.png; do
    # check if the file exists
    if [ -f "$file" ]; then
        # Convert png to jpg using imagemagick
        convert "$file" "${file%.png}.jpg"
    fi
done

echo "Conversion complete!"
