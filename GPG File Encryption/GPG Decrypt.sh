#!/bin/bash
echo Type filename to decrypt
read -p "Filename: " filename
filenamenogpg="$(basename "$filename" .gpg)"
gpg -o "$filenamenogpg" -d "$filename"
echo Finished!
sleep 5