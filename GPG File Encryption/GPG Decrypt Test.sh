#!/bin/bash
echo Type filename to test decrypt
read -p "Filename: " filename
filenamenogpg="$(basename "$filename" .gpg)"
gpg -o "Test $filenamenogpg" -d "$filename"
echo Finished!
sleep 5