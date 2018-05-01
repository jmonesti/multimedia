#!/bin/sh -f

backuphome="$HOME/backup"
backupdir=$backuphome/$1
backupname=$backupdir/`date +%F`.tar.gz

echo "Backing up $1 to $backupname"

mkdir -p $backupdir

tar zcvf $backupname $1
