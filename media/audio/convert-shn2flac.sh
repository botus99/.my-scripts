#!/usr/bin/env bash

set -euo pipefail

# my old one-liner (kept here for posterity)
#for i in *.shn; do ffmpeg -i "$i" -compression_level 8 "${i%.*}.flac"; done

# config
readonly COMPRESSION_LEVEL=8
readonly INPUT_PATTERN="*.shn"
count=0
failed=0

# exit if no files found
shopt -s nullglob

for input in $INPUT_PATTERN; do
    output="${input%.*}.flac"
    ((count++))

    echo "[${count}] Converting: $input → $output"

    if ffmpeg -hide_banner -loglevel error -i "$input" \
        -compression_level "$COMPRESSION_LEVEL" \
        -y "$output" 2>&1 | grep -i error; then
        echo "❌ Failed: $input"
        ((failed++))
        continue
    fi

    echo "✓ Completed: $output"
done

echo ""
echo "Summary: $((count - failed))/$count successful"
[[ $failed -eq 0 ]] && exit 0 || exit 1
