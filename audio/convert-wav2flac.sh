#!/usr/bin/env bash
for i in *.wav; do ffmpeg -i "$i" -compression_level 8 "${i%.*}.flac"; done
