#!/bin/sh
echo Type filename to decrypt
read -p "Filename: " filename
filenamenogpg="$(basename "$filename" .gpg)"
gpg --output "$filenamenogpg" --decrypt "$filename"
echo Finished!
sleep 5