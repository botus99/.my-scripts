#!/usr/bin/env bash
##=============================================================================#
# name:        h265ify.sh
# author:      botus99
# updated    : 2026-05-05
# description: reencode all mkv files in current directory to mp4 using...
#               - nvenc encoder
#               - 10-bit color depth
#               - variable bitrate (constant quality)
#
# some common video filters: hqdn3d, deblock, deband (add after deinterlacing if using these)
# here are some deinterlacing filters to add when needed...
#           -vf bwdif \ # Uncomment for frame-doubling bob de-interlacing
#           -vf yadif=1 \ # Uncomment for frame-doubling yadif de-interlacing
#           -vf fieldmatch,decimate,fps=24000/1001 \ # Uncomment for converting 29.97fps (TV) to 23.976fps (film)
#=============================================================================#

for file in ./*.mkv; do
    ffmpeg \
          -hide_banner \
          -hwaccel auto \
          -i "$file" \
          -map 0:v \
          -map 0:a \
          -map_chapters 0 \
          -pix_fmt p010le \
          -gpu any \
          -profile:v main10 \
          -speed veryslow \
          -c:v hevc_nvenc \
          -preset:v p7 \
          -tune:v hq \
          -ac 2 \
          -q:a 0.75 \
          -rc-lookahead 32 \
          -qmin 1 \
          -qmax 51 \
          -cq 27 \
          -movflags +faststart \
          "${file%.mkv}.mp4"
done
