#! /usr/bin/env python3
import os
from pydub import AudioSegment
from pydub.effects import normalize

def normalize_audio(input_file, output_file):
    # Load the audio file
    audio = AudioSegment.from_file(input_file, format='wav')

    # Normalize the audio
    normalized_audio = normalize(audio)

    # Export the normalized audio
    normalized_audio.export(output_file, format='wav')

# Get the current directory
current_directory = os.getcwd()

# Iterate over files in the current directory
for filename in os.listdir(current_directory):
    if filename.endswith(".wav"):
        input_file = os.path.join(current_directory, filename)
        output_file = os.path.join(current_directory, "normalized_" + filename)
        normalize_audio(input_file, output_file)
