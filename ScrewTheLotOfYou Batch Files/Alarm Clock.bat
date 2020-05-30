@echo off
SetLocal EnableDelayedExpansion


::This variable dictates whether there is a pause between each time check, having this variable set to 1 will reduce the cpu usage of this hugely, by using ping.exe to pause between each check. If you need to use ping.exe whilst running this program, set this to 0. Otherwise set it to 1.
set timeCheckDelay=1

if "%1"=="" (
	call :function_recieveArguments
	if "!background!"=="1" (
		for /f "delims=" %%I in ("%0") do set filePath=%%~sI
		call :function_startBackgroundRun
		::cls
		echo Alarm set for !alarmTime!. Running in BACKGROUND mode.
		echo You can now close this window.
	) else (
		cls
		title !alarmTime! - ScrewTheLotOfYou's Batch Alarm Clock
		echo Alarm set for !alarmTime!. To cancel the alarm, close this window.
		call :function_alarmWait
	)
) else (

	::Find the path of this file, so the program can start itself.
	for /f "delims=" %%I in ("%0") do set filePath=%%~sI
	
	::Collect all the arguments together, for processing in the next fucntion.
	for /f "delims=" %%I in ("%*") do set argumentString=%%I

	call :function_processArguments
)

::Executes the final command set by the user.

%finishCommand%
exit /b

:function_processArguments

	for /f "delims= " %%I in ("!argumentString!") do set alarmTime=%%I

	::Check the time is valid.
	set passCheck=0
	call :function_checkTimeValididty
	if NOT %passCheck%==1 (
		call :function_syntaxError
		exit /b
	)

	::Remove the first argument from argumentString; the time.
	for /f "tokens=1* delims= " %%I in ("!argumentString!") do set argumentString=%%J

	::If /b is specified, set backGround=1 and remove this from argumentString.
	for /f "tokens=1* delims= " %%I in ("!argumentString!") do if "%%I"=="/b" (
		set background=1
		set argumentString=%%J
	) else (
		set background=0
	)

	::Now all that's left in argumentString is the final command set by the user.

	for /f "delims=" %%I in ("!argumentString!") do set finishCommand=%%I

	if %background%==0 (
		title !alarmTime! - ScrewTheLotOfYou's Batch Alarm Clock
		echo Alarm set for !alarmTime!. To cancel the alarm, close this window.
		call :function_alarmWait
		exit /b
	)
	::Puts the ^ characters back in where they are needed and have been lost.
	for /f "delims=" %%I in ("%finishCommand:^=^^%") do set finishCommand=%%I
	for /f "delims=" %%I in ("%finishCommand:>=^>%") do set finishCommand=%%I
	for /f "delims=" %%I in ("%finishCommand:<=^<%") do set finishCommand=%%I
	for /f "delims=" %%I in ("%finishCommand:|=^|%") do set finishCommand=%%I
	for /f "delims=" %%I in ("%finishCommand:&=^&%") do set finishCommand=%%I

	call :function_startBackgroundRun
	exit /b


:function_startBackgroundRun

	::Creates a temporary .vbs file, to facilitate background execution.
	for /f "delims=" %%J in ("CreateObject("Wscript.Shell").Run "" & WScript.Arguments(0) & "", 0, False") do echo %%~J > %temp%\vbAlarm.tmp

	::Start the .vbs, which starts this program in the background, passing the original arguments excluding "/b".
	Wscript.exe //e:vbscript "%temp%\vbAlarm.tmp" "!filePath! !alarmTime! !finishCommand!"

	::Delete the temporary .vbs file. End the program without performing the finalCommand, it will be executed by the background version.
	del %temp%\vbAlarm.tmp
	set finishCommand=
	exit /b

:function_recieveArguments

	::This function is called if the user didn't pass arguments to the program.

	echo ScrewTheLotOfYou's Batch Alarm Clock
	echo ------------------------------------
	echo.
	echo Syntax: AlarmClock HH:MM [/b] [Command]
	echo.
	echo.	HH:MM - The time for the alarm to go off.
	echo.
	echo.	/b - Makes the program run in BACKGROUND mode, no window is visible.
	echo.	     (The program runs in VISIBLE mode by default.)
	echo.
	echo.	Command - The program or command to execute on alarm.
	echo.
	echo. NOTE: If you want to use special characters (such as ^> and ^&), you MUST
	echo.       write a ^^ before each character. For example: ECHO Test ^^^> Test.txt
	echo.
	:enterAlarmTime
		:://Set the alarm time.
		set /p alarmTime= Enter the alarm time (HH:MM) - 

		set passCheck=0
		call :function_checkTimeValididty
		if NOT %passCheck%==1 (
			goto enterAlarmTime
		)
	:checkBackground
		set /p checkBackground="Run the program in BACKGROUND mode? [Y/N] - "
		if /i "%checkBackground%"=="Y" (
			set background=1
		)
		if /i "%checkBackground%"=="N" (
			set background=0
		)
		if NOT defined background goto checkBackground

	:://Set the command to perform on alarm.
	:://No checks on this.
	set /p finishCommand=Enter the command that should be executed on alarm - 
	
	::Removes the ^ characters. They must be kept in on a background run to pass the arguments properly.
	if "%backGround%"=="0" (
		set finishCommand=%finishCommand%
	)
	exit /b		


:function_checkTimeValididty
	:://Check that the time entered is valid. If it is valid, goto enterCommandToExecute.
	set alarmTime=%alarmTime: =%
	if "%alarmTime:~0,5%"=="%alarmTime%" (
		if "%alarmTime:~0,1%" leq "2" (
			if "%alarmTime:~0,2%" leq "23" (
				if "%alarmTime:~1,1%" leq "9" (
					if "%alarmTime:~2,1%"==":" (
						if "%alarmTime:~3,1%" leq "5" (
							if "%alarmTime:~4,1%" leq "9" (
								if "%alarmTime:~0,1%" geq "0" (
									if "%alarmTime:~1,1%" geq "0" (
										if "%alarmTime:~3,1%" geq "0" (
											if "%alarmTime:~4,1%" geq "0" (
												set passCheck=1
												exit /b
											)
										)
									)
								)
							)
						)
					)
				)
			)
		)
	)
	exit /b



::This function check the time to see if it matches the alarm time. If not, PINGs the set number of times, then tests again. If so, ends.

:function_alarmWait
	if %time:~0,5%==%alarmTime% (
		exit /b
	)
	for /L %%I in (1,1,%timeCheckDelay%) do (
		ping localhost -n 2 >nul
	)
	goto function_alarmWait


:function_syntaxError
echo ERROR: The time you entered is invalid and the program cannot continue.
echo.
echo Press any key to exit.
pause>nul
set finishCommand=
exit /b