# .my-scripts
These scripts help with optimizing media for streaming or archival purposes, updating applications, and generating basic text. 👀

## 📖 Description
These scripts serve various purposes ranging from automating installation of retro bios files, to converting/recompressing .zip files to .7z, to encoding videos to my preferred 10-bit h265 format with ffmpeg and nvenc. The repository is open for others to explore, use, or modify if they find the scripts helpful. 🌟

Some scripts are written in Python to unify usage between operating systems. Some are written as Windows batch files (originally written when I used Windows). Some are Bash scripts (my new favorite). I had to start somewhere, and these were for my own purposes. I may rewrite some bash or batch scripts into python one day, but it is currently not a priority. I don't plan on writing any more batch scripts.

## 💻 Usage
You can clone the repository to your machine using the following command:
```
git clone https://github.com/botus99/.my-scripts.git
```
The scripts are mostly meant to run within the current working directory (notable exceptions: retro bios and shader download scripts). Copy/pasting these scripts as needed should do the trick! Or, if you're crafty, you can always link these to your somewhere in your $PATH to execute them as any other terminal application.

Keep in mind that some scripts may require specific dependencies or configurations, specifically python, ffmpeg, jpegoptim, oxipng, mediainfo, and mkvmerge. Assuming your apps are installed and shims are working, these scripts should require zero setup.
