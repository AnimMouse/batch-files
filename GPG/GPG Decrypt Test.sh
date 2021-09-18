#!/bin/sh
echo Type filename to test decrypt
read -p "Filename: " filename
filenamenogpg="$(basename "$filename" .gpg)"
gpg --output "Test $filenamenogpg" --decrypt "$filename"
echo Finished!
sleep 5