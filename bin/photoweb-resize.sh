#!/bin/sh -f

# c2c max: 8192 x 2048
# 4/3  4000 x 3000 -> 2730 x 2048
# 16/9 4000 x 2250 -> 3640 x 2048

mkdir -p resize

#for file in $(find . -type f | grep -v resize | sort)
for ifile in $(find . -maxdepth 1 -name \*.JPG -or -name \*.jpg | sort)
do

	ofile=`echo $ifile | sed 's/\(.*\)\.\(.*\)$/\1-4000x3000-85.\2/'`

	echo - Resizing $ifile to $ofile

	convert $ifile -resize x3000 -quality 85 resize/$ofile

done
