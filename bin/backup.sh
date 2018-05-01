#!/bin/bash -f

backupsrc=( $HOME/Vidéos $HOME/Images )

backupdst="/media/jeff/Backup/backup"


for src in "${backupsrc[@]}"
do
	echo "Backing up $src to $backupdst"

	rsync -avz $src $backupdst
done
