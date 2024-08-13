#!/usr/bin/env bash

for file in ./*.mkv; do
    ffmpeg -hide_banner -hwaccel auto -i "$file" \
          -map 0:v -map 0:a -map_chapters 0 \
          -pix_fmt p010le -gpu any -profile:v main10 \
          -speed veryslow -c:v hevc_nvenc -preset:v p7 \
          -tune:v hq -ac 2 -q:a 0.75 -rc-lookahead 32 \
          -qmin 1 -qmax 51 -cq 27 -movflags +faststart \
          "${file%.mkv}.mp4"
done
