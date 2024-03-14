#!/bin/bash

outputPath=$(pwd)

for file in *.zip; do
    echo "📦 Extracting \"$file\" with 7zip..."
    7z e -o"$outputPath/${file%.*}" "$file" > /dev/null
    echo "✨ Compressing \"$file\" with 7zip..."
    7z a -t7z "$outputPath/${file%.*}.7z" "$outputPath/${file%.*}"/* > /dev/null
    echo "🗑️ Cleaning up..."
    rm -rf "$outputPath/${file%.*}"
done

echo "✅ Poof! Your .zip's are .7z's now. I didn't delete the original zips. You do it."
read -p "Press any key to continue..."
