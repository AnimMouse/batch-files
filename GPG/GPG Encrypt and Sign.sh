#!/bin/sh
echo Type fingerprint or email address of the public key that will be used to encrypt
read -p "Public Key: " publickey
echo Type fingerprint or email address of the private key that will be used to sign
read -p "Private Key: " privatekey
echo Type filename to encrypt
read -p "Filename: " filename
gpg --encrypt --recipient "$publickey" --sign --default-key "$privatekey" --cipher-algo AES256 --s2k-digest-algo SHA512 --compress-algo none --output  "${filename}.gpg" "$filename"
echo Finished!
sleep 5