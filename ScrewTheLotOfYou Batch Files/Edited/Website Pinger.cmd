@echo off
setlocal
Title Website Pinger
color 0e
goto TheQuestionIP

:TheQuestionIP
cls
echo Enter the IP/Website you would like to ping
set address=
set /p address=Enter your IP/Website here:
if not defined website goto TheQuestionIP
if defined website goto TheQuestionPing

:TheQuestionPing
cls
echo Enter the data you would like to ping
echo Default to 32 if not entered.
set data=
set /p data=Enter your Data here:
if not defined data set data=32 & goto TheQuestionTime
if defined data goto TheQuestionTime

:TheQuestionTime
cls
echo Number of times to ping.
echo Default to 4 if not entered.
set times=
set /p times=Enter your Number here:
if not defined times set times=4 & goto Process
if defined times goto Process

:Process
color c
set PingingStartTime=%time%
set PingingStartDate=%date%
echo -----------------------
echo Now Pinging Website...
echo -----------------------
echo Website about to be pinged:%website%
echo Data about to be pinged:%data%
echo Time that Pinging Start:%PingingStartTime%
echo Date that Pinging Start:%PingingStartDate%
echo Log:
ping %address% -n %times% -l %data%
cls
color 0e
echo Finished!
echo IP/Website about to be pinged:%address%
echo Data about to be pinged:%data%
echo Time that Pinging Stopped:%time%
echo Date that Pinging Stopped:%date%
echo Press any key to exit.
pause>nul
exit