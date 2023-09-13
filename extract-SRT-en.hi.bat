# Script to extract SRT subtitles from movie files
# Be sure to change the track number from "3" to the track number of your desired subtitle track or tracks

@echo off

for %%a in (*.wmv, *.avi, *.mpg, *.mpeg, *.mkv, *.mp4, *.m4v, *.flv, *.mov, *.webm) do (
    mkvextract tracks "%%a" 3:"%%~na.en.hi.srt"
)
pause