#!/bin/sh
echo Type fingerprint or email address of the public key that will be used to encrypt
read -p "Key: " key
echo Type filename to encrypt
read -p "Filename: " filename
gpg --encrypt --recipient "$key" --cipher-algo AES256 --s2k-digest-algo SHA512 --compress-algo none --output "${filename}.gpg" "$filename"
echo Finished!
sleep 5