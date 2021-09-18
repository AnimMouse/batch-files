#!/bin/sh
echo Type fingerprint or email address of the private key that will be used to sign
read -p "Key: " key
echo Type filename to encrypt
read -p "Filename: " filename
gpg --sign --default-key "$key" --cipher-algo AES256 --s2k-digest-algo SHA512 --compress-algo none --output "${filename}.sig" "$filename"
echo Finished!
sleep 5