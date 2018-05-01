#!/bin/sh

for i in *.mp3
do
	#eyeD3 --to-v1.1 $i
	#eyeD3 --remove-v2 $i
	eyeD3 --to-v2.3 "$i"
	eyeD3 --to-v2.3 --add-image "$1":FRONT_COVER:"$1" "$i"
done
