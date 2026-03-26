#!/usr/bin/env python3
import os
from pydub import AudioSegment
from pydub.effects import normalize

def normalize_audio(input_file, output_file):
    # load audio file
    audio = AudioSegment.from_file(input_file, format='wav')

    # normalize audio
    normalized_audio = normalize(audio)

    # export normalized audio
    normalized_audio.export(output_file, format='wav')

# get current directory
current_directory = os.getcwd()

# iterate over files in current directory
for filename in os.listdir(current_directory):
    if filename.endswith(".wav"):
        input_file = os.path.join(current_directory, filename)
        output_file = os.path.join(current_directory, "normalized_" + filename)
        normalize_audio(input_file, output_file)
