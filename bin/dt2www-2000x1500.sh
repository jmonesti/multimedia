#!/bin/sh -f

# c2c max: 8192 x 2048
# 4/3  4000 x 3000 -> 2730 x 2048
# 16/9 4000 x 2250 -> 3640 x 2048

mkdir -p resize

#for file in $(find . -type f | grep -v resize | sort)
for ifile in $(find . -maxdepth 1 -name \*.JPG -or -name \*.jpg | sort)
do
	ofile=`echo $ifile | sed 's/\(.*\)\.\(.*\)/\1-2000x1500-80.\2/'`

	echo - Resizing $ifile to $ofile

	convert $ifile -resize 2000x1500\! -quality 80 +profile "*" -strip resize/$ofile
	exiftool -colorspace=sRGB resize/$ofile
	# convert $ifile -auto-orient -resize x1500 -quality 80 resize/$ofile
	# convert $file -resize x1200 -quality 95 resize/$file
	# convert $file -resize 1024x -quality 80 resize/$file
	# convert $file -resize x768 -quality 80 resize/$file
done

find . -name \*_original -exec rm -f {} \;
