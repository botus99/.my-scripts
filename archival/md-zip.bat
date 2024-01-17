@echo off

REM Set the path to the folder containing the bin files
set "folder=C:\path\to\folder"

REM Navigate to the folder
cd %folder%

REM Loop through all the bin files and create a zip file for each one
for %%f in (*.md) do (
    echo Creating zip file for %%f...
    7z a -tzip "%%~nf.zip" "%%f"
)

echo Done.

pause
