#!/bin/sh
#
# open webcam in mpv

mpv --demuxer-lavf-o=video_size=1280x720,input_format=rawvideo av://v4l2:/dev/video0 --profile=low-latency
