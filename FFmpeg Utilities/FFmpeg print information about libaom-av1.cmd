@echo off
setlocal
title %~n0
set codec=libaom-av1
ffmpeg -hide_banner -h encoder=%codec%
ffmpeg -hide_banner -h encoder=%codec% > %codec%.txt
pause