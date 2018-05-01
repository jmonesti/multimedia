#!/bin/bash -f

src=$1

mp4=`basename $src .mp4`-640x360-1024kbps.mp4

# dmc-g5 - source 720p
# HandBrakeCLI --preset "iPhone & iPod touch" --width 640 --vb 1024 --optimize --two-pass --turbo --input $src --output $mp4

avconv -i $src -b:v 1024k -maxrate 1024k -bufsize 1000k -vf scale=640:-1 $mp4

# THEN, FASTSTART !!!
qt-faststart $mp4 faststart-$mp4

webm=`basename $src .mp4`-640x360-1024kbps.webm

avconv -i $src -b:v 1024k -maxrate 1024k -bufsize 1000k -vf scale=640:-1 $webm
