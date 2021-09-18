#!/bin/sh
echo Type filename to verify
read -p "Filename: " filename
gpg --verify "$filename"
echo Finished!
sleep 10