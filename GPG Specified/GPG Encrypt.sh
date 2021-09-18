#!/bin/sh
echo Type filename to encrypt using this public key
key=
read -p "Filename: " filename
gpg --encrypt --recipient "$key" --cipher-algo AES256 --s2k-digest-algo SHA512 --compress-algo none --output "${filename}.gpg" "$filename"
echo Finished!
sleep 5