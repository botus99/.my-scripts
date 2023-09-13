# Script to remove subtitles from movie files

@echo off

for %%f in (*.wmv, *.avi, *.mpg, *.mpeg, *.mkv, *.mp4, *.m4v, *.flv, *.mov, *.webm) do (
    mkvmerge -o "%%~nf--no-subs.mkv" --no-subtitles "%%f"
)
pause