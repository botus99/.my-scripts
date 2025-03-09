@echo off
setlocal enabledelayedexpansion

set "outputPath=%cd%"

for %%F in (*.zip) do (
    echo 📦 Extracting "%%~nxF" with 7zip...
    7z e -o "!outputPath!\%%~nF" "%%~fF" > nul
    echo ✨ Compressing "%%~nxF" with 7zip...
    7z a -t7z -mx=9 "!outputPath!\%%~nF.7z" "!outputPath!\%%~nF\*" > nul
    echo 🗑️ Cleaning up...
    rd /s /q "!outputPath!\%%~nF"
)

echo ✅ Poof! Your .zip's are .7z's now. I didn't delete the original zips. You do it.
pause
