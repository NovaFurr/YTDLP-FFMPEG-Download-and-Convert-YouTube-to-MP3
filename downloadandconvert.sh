#!/bin/bash
# ^ We use BASH

# REQUIREMENTS: ffmpeg, yt-dlp
# Arch / Arch based distros use the command below to install
# sudo pacman -S ffmpeg yt-dlp 

# This is a very botched together script, i know this can be made much better
# but for my needs it is perfectly enough
# If you want to improve this script, please fork it
#
# Remember to make this script executable by doing chmod +x (scripts name).sh

clear # Comment out if you want to make it so it don't clean the console 

# DOWNLOAD PART
echo "Downloading video with URL $1"
yt-dlp -x $1 &>/dev/null # FIRT VAR IS YT VID 


# Find file
FILE="$(ls | grep .opus)" # Grep all opus files 

TRUN="${FILE:0:-19}" # Trunicate string 
TRUN=$(echo "$TRUN" | sed -E 's/[^a-zA-Z0-9\s\-_]+//g')

# Create a debug file if anythig would go wrong
 # echo $FILE >> debug.txt
 # echo STRING: "$TRUN.opus" >> debug.txt

# Get the fileo to convert into an actual variable
FILE2CONV="$TRUN.opus"

clear # Again, remove if no console clear

echo "Converting $FILE into $TRUN.mp3"
ffmpeg -i ./"$FILE" "$TRUN.mp3" &>/dev/null

rm ./$FILE

clear # Yet again, remove if you don't want a clear
echo "All done :3"
