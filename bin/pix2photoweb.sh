#!/bin/sh -f

# c2c max: 8192 x 2048
# 4/3  4000 x 3000 -> 2730 x 2048
# 16/9 4000 x 2250 -> 3640 x 2048

mkdir -p photoweb

ifile=$1

ofile=`echo $ifile | sed 's/\(.*\)\.\(.*\)/\1-x-80-phtwb.\2/'`

echo - Converting $ifile to photoweb/$ofile

convert $ifile -quality 80 +profile "*" -strip -profile /home/jeff/Photoweb/ICC-Profiles/Photoweb-V5.icm photoweb/$ofile

