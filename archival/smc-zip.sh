#!/bin/bash

# Function to recursively create zip files from bin files
function create_zip_recursive {
    local folder="$1"

    # Navigate to the folder
    cd "$folder" || exit

    # Loop through all the files and directories
    for item in *; do
        if [[ -d "$item" ]]; then
            # If it's a directory, recursively call the function
            create_zip_recursive "$item"
        elif [[ "$item" == *.smc ]]; then
            # If it's a bin file, archive with 7z
            echo "Creating zip file for $item..."
            7z a -tzip -mx=9 "${item%.*}.7z" "$item"
        fi
    done

    # Move back to the parent directory after processing
    cd ..
}

# Start the recursive operation from the current directory
create_zip_recursive "$(pwd)"

echo "Done."
