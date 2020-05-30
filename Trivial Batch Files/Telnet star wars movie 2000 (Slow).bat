@echo off
title MS-DOS Telnet Auto Loader

set framecount=0

::~~~~~~~~ Set the frame delay below, this is how fast the program will change frame.
::~~~~~~~~ The fastest is 1, bigger numbers means a slower frame rate.
::~~~~~~~~ Try out finding your ideal frame rate.

set framedelay=5

:CallFrameLoop
set /a framecount= %framecount% + 1
set /a endtime= %time:~9,1% + %framedelay%
if /i %endtime% geq 10 set /a endtime= endtime - 10
call :FrameCheck
Call :Frame%FrameCount% 2>nul
goto CallFrameLoop

:FrameCheck
if /i %time:~9,1% neq %endtime% goto FrameCheck
exit /b

:Frame1
cls
echo Checking Framedelay
echo Framedelay=%framedelay%
exit /b

:Frame5
cls
echo Loading Telnet
echo .
echo Wait to INVOKE Telnet.
exit /b

:Frame10
cls
echo Loading Telnet
echo ..
echo Wait to INVOKE Telnet.
exit /b

:Frame15
cls
echo Loading Telnet
echo ...
echo Wait to INVOKE Telnet.
exit /b

:Frame20
cls
echo Invokeing Telnet
echo .................
exit /b

:Frame25
cls
echo Invokeing Telnet Auto Loader
echo ....................................
exit /b

:Frame30
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!           :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame35
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!          :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame40
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!!         :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame45
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!!!        :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame50
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!!!        :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame55
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!!!!       :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame60
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!!!!!      :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame65
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!!!!!!     :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame70
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!!!!!!!    :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame75
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!!!!!!!!   :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame80
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!!!!!!!!!  :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame85
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!!!!!!!!!! :
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100
exit /b

:Frame90
cls
echo.
echo               Telnet
echo.
echo.
echo           --------------
echo           :!!!!!!!!!!!!:
echo           --------------
echo.
echo.
echo.
echo            (C)Microsoft
echo            Framedelay=%framedelay%
FRAMEDELAY=100

telnet towel.blinkenlights.nl

exit