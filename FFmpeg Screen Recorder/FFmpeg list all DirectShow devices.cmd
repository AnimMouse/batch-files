@echo off
setlocal
title %~n0
ffmpeg -hide_banner -list_devices true -f dshow -i dummy
pause