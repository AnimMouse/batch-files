#!/bin/bash
echo Type the email address of the key that will be used to encrypt
read -p "Email Address: " email
echo Type filename to encrypt
read -p "Filename: " filename
gpg --trust-model always -e -r "$email" --cipher-algo AES256 --s2k-digest-algo SHA512 --compress-algo none -o "${filename}.gpg" "$filename"
echo Finished!
sleep 5