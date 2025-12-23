# .my-scripts

##### TLDR: Gaming and Linux ISO stuff here. Also media management, archival, doom wad, and text generation stuff.

## 📖 Description
These scripts serve various purposes ranging from automating installation of retro bios files, to converting/recompressing .zip files to .7z, to encoding videos to my preferred 10-bit h265 format with ffmpeg and nvenc. The repository is open for others to explore, use, or modify if they find the scripts helpful.

Some scripts are written in Python for cross-platform use. Some are Windows batch files (originally written when I used Windows). Some are Bash scripts. I had to start somewhere, and these were for my own purposes. I don't plan on writing any new batch scripts or maintaining the ones already in this repo.

## 💻 Usage
Clone the repository with the following command:
```
git clone https://github.com/botus99/.my-scripts.git
```
Most scripts meant to run within the current working directory (notable exceptions: retro bios and shader download scripts). You can link these to your somewhere in your $PATH to enable executing them as any other terminal application. Or, you can just copy/paste them as needed. You do you. 🙂 There is at least one script (gaming/update-wads.sh) that sources other scripts in this repo. I recommend cloning this repo in your $HOME directory (for instance, /home/your-username/.my-scripts) to make sure things work as intended. Of course, you can always modify the scripts for your own workflow. Go for it! 🤘

Some scripts will require configuration to work on your system (i.e. media/mlmf.sh). As always, read the scripts before running them.

Keep in mind that these scripts may require dependencies, specifically python, find, fzf, imagemagick, jpegoptim, oxipng, ffmpeg (from the Unofficial Multimedia Packages repo for nvidia codec support), mediainfo, mkvmerge, and mpv. Assuming the needed dependencies are installed and working, these scripts should work.