@echo off
setlocal
title %~n0
:Start
echo Type the external KMS server address
set server=
set /p server=Server:
if NOT defined server goto Start
cd C:\Program Files\Microsoft Office\Office16
echo --------------------
cscript ospp.vbs /dstatus
echo --------------------
cscript ospp.vbs /sethst:%server%
echo --------------------
cscript ospp.vbs /act
echo --------------------
cscript ospp.vbs /dstatus
echo Finished!
pause