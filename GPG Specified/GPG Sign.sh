#!/bin/sh
echo Type filename to encrypt using this private key
key=
read -p "Filename: " filename
gpg --sign --default-key "$key" --cipher-algo AES256 --s2k-digest-algo SHA512 --compress-algo none --output "${filename}.sig" "$filename"
echo Finished!
sleep 5