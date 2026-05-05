#!/bin/sh

# reference link: https://mpv.io/manual/master/#low-latency-playback

# fix for vapoursynth issue
#unset LD_LIBRARY_PATH

# open webcam in mpv
mpv av://v4l2:/dev/video0 \
  --demuxer-lavf-o=video_size=1280x720,input_format=mjpeg \
  --profile=low-latency \
  --opengl-glfinish=yes \
  --opengl-swapinterval=0 \
  --untimed \
  --framedrop=no \
  --speed=1.01 \
  --really-quiet \
  --no-terminal \
  --force-window=yes \
  --container-fps-override=60
