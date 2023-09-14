import os

for filename in os.listdir():
    if filename.endswith(('.wmv', '.avi', '.mpg', '.mpeg', '.mkv', '.mp4', '.m4v', '.flv', '.mov', '.webm')):
        os.system(f'mkvmerge -o "{os.path.splitext(filename)[0]}--no-subs.mkv" --no-subtitles "{filename}"')

input('All done! Press Enter to exit...')