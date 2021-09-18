@echo off
:: Convert all FLAC files to M4A AAC and put it in the M4A folder.
:: You must have libFLAC.dll besides the qaac64.exe in order for this to work.
setlocal
title %~n0
set tvbr=91
qaac64 -V "%tvbr%" *.flac -d M4A
pause