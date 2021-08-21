@echo off
:: 7zip Archive a folder sorted by file extension (-mqs=on) and use separate solid block (-ms=e) for each file extension.
setlocal
title %~n0
:Start
echo Type Folder Name
set folder=
set /p folder=Folder Name:
if NOT defined folder goto Start
7z a "%folder%.7z" "./%folder%/*" -mx=9 -ms=e -mqs=on
echo Finished!
echo --------------------
goto Start