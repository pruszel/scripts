#!/bin/bash
##
# This script should only be run by
# Deluge Execute plugin
##
torrentid=$1
torrentname=$2
torrentpath=$3

# Log
logfile="/var/lib/deluge/torrents.log"
if [ -w $logfile ];
then
    echo -e "Torrent Complete: $torrentname\t$torrentpath" >> $logfile
fi

# Set permissions
chmod 775 -R $torrentpath

# ** should be handled by Label plugin **
#
# Move to Plex
# if [[ $torrentpath == *"Movies"* ]]; then
# 	mv -R "$torrentpath/$torrentname" /media/plex/Movies;
# elif [[ $torrentpath == *"TV"* ]]; then
# 	mv -R "$torrentpath/$torrentname" /media/plex/TV;
# fi
