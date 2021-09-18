#!/bin/sh
echo Type filename to encrypt and sign using this key
publickey=
privatekey=
read -p "Filename: " filename
gpg --encrypt --recipient "$publickey" --sign --default-key "$privatekey" --cipher-algo AES256 --s2k-digest-algo SHA512 --compress-algo none --output "${filename}.gpg" "$filename"
echo Finished!
sleep 5