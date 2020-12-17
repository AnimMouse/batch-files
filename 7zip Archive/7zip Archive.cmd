@echo off
:: 7zip Archive a folder sorted by file extension and use separate solid block for each new file extension.
setlocal
:Start
echo Type Folder Name
set folder=
set /p folder=Folder Name:
if NOT defined folder goto Start
7z a "%folder%.7z" "./%folder%/*" -mx=9 -ms=e -mqs=on
echo Finished!
echo --------------------
goto Start