#!/bin/sh -f

# c2c max: 8192 x 2048
# 4/3  4000 x 3000 -> 2730 x 2048
# 16/9 4000 x 2250 -> 3640 x 2048

mkdir -p resize

for file in $(find . -type f)
do
	echo - Resizing $file
	# convert $file -resize x2048 -quality 75 resize/$file
	# convert $file -resize x1500 -quality 80 resize/$file
	convert $file -resize x768 -quality 80 resize/$file
done
