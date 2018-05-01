#!/bin/sh -f

# c2c max: 8192 x 2048
# 4/3  4000 x 3000 -> 2730 x 2048
# 16/9 4000 x 2250 -> 3640 x 2048

mkdir -p resize

ifile=$1

ofile=`echo $ifile | sed 's/\(.*\)\.\(.*\)/\1-2000x1500-80-srgb.\2/'`

echo - Resizing $ifile to $ofile

convert $ifile -profile /home/jeff/ICC-Profiles/sRGB.icc -colorspace RGB -resize x1500 -quality 80 -colorspace sRGB -profile /home/jeff/ICC-Profiles/sRGB.icc +profile "icc" resize/$ofile
