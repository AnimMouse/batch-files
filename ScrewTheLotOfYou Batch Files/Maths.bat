@echo off
setlocal enabledelayedexpansion
title Decimal Calculator.
echo This is an unfinished project by ScrewTheLotOfYou.
echo I stopped work on this as I was unhappy with the maximum decimal place limit of 7 characters in the square root function.
echo The system needs a complete re-think I believe, as it is very slow at the moment.
echo I may decide to work on this again, but for now, this is it. I'm releasing this only because lots of people have asked about such a system.
echo.
pause
:start
cls
echo Enter the number of the desired function
echo 1. Square root finder
echo 2. Decimal addition
echo 3. Decimal subtraction
echo 4. Long Division
echo 5. Long Multiplication
set /p choice=
call :choice%choice% 2>nul
cls
set choice=
goto start


:Choice3

echo Enter Starting number.
set ls2=
set /p LS1=
echo Enter Number to take away.
set ls2=
set /p LS2=
Call :longSub
echo %LSAnswer%
pause
exit /b


:Choice2

echo Enter the first number.
set LA1=
set /p LA1=
echo Enter the second number.
set LA2=
set /p LA2=

Call :longadd
echo %LAAnswer%
pause
exit /b




:Choice4

echo Enter the numerator.
set /p LDa=
echo Enter the denominator.
set /p LDb=
echo Enter how many decimal places required.
set /p dp=

if not defined dp set dp=10

call :longdiv
echo %LDanswer%
pause
exit /b




:Choice5
echo Enter the first number.
set /p Number1=
echo Enter the second number.
set /p Number2=
call :Longmul %Number1% %Number2%
echo %LMAnswer%
pause
exit /b



:choice1
echo Enter the number you wish to find the square root of.
set /p SqStartnumber=
if /i "%Sqstartnumber%"=="" goto :choice1
Call :Sqrt %Sqstartnumber%
echo %SQG%
pause
exit /b











:Sqrt

if /i not "%1"=="" (
set SQstartnumber=%1
)


for /f "tokens=1,2 delims=." %%I in ("%SqStartNumber%") do (
set SQBefore=%%I
Set SQAfter=%%J0
)


if /i %SqBefore% lss 0 (
echo There is no real root for negative numbers.
exit /b
)

if /i "%SqStartnumber%"=="0" (
echo 0
exit /b
)



set SQN=%Sqstartnumber%

set /a SQG=1
if /i %SqBefore% geq 1000 set SQG=30
if /i %SqBefore% geq 10000 set SQG=100
if /i %SqBefore% geq 100000 set SQG=316
if /i %SqBefore% geq 432964 set SQG=658
if /i %SqBefore% geq 1000000 set SQG=1000

:Perfect
set /a SQT=SQG*SQG
if /i %SQT% equ %SQN% echo %SQG%& pause& exit /b
if /i %SQT% gtr %SQN% goto Setup_Workout
set /a SQG=SQG+1
goto Perfect

:Setup_Workout
set /a SQG= (%SQG%-1)



:Workout



set dp=7
Call :LongDiv %SQN% %SQG%

if /i "%LDAnswer%"=="%SQG%" goto SQ_Sort_Final_Number

call :Longadd %LDanswer% %SQG%
set dp=7

set LDa=%LAAnswer%
set LDb=2

Call :LongDiv

set OldSQG=%SQG%
set SQG=%LDAnswer%

if /i "%OldSQG%"=="%SQG%" goto SQ_Sort_Final_Number
goto Workout


:SQ_Sort_Final_Number
exit /b











:LongAdd

if /i not "%1"=="" (
set LA1=%1
set LA2=%2
)

set LAAnswer=
Set LAAfter=

for /f "tokens=1,2 delims=." %%I in ("%LA1%") do (
set LA1Before=%%I
Set LA1After=%%J0
)

for /f "tokens=1,2 delims=." %%I in ("%LA2%") do (
set LA2Before=%%I
set LA2After=%%J0
)

if /i 1%LA2After% gtr 1%LA1After% (
set LA1After=%LA2After%
set LA2After=%LA1After%
)

set LA1L=1

:Find_La1_Length
if /i not "!LA1After:~%LA1L%,1!"=="" (
set /a LA1L= LA1L + 1
goto Find_La1_Length
)

set /a LA1l= %LA1l% - 1

set plusone=

:Add_Afters
set /a LAAfterDigit= %Plusone% + !LA2After:~%LA1L%,1! +!LA1After:~%LA1L%,1!
set plusone=
if /i %LAAfterDigit% geq 10 (
set PlusOne=1
set LAAfterdigit=%LAAfterDigit:~1%
)
set LAAfter=%LAAfterDigit%%LAAfter%
if /i %LA1l% leq 0 goto Add_Befores
Set /a LA1L= %LA1L% - 1
goto add_afters


:Add_Befores
Set /a LABefore= %plusone% + %LA2Before% + %LA1Before%

set LAAnswer=%LABefore%.%LAAfter%


:LATrailingNoughts
if /i "%LAAnswer:~-1%"=="0" (
set LAAnswer=%LAAnswer:~0,-1%
goto LATrailingNoughts
)

:LAUnnecessary_Decimal_Point_Removal
if /i "%LAAnswer:~-1%"=="." (
set LAAnswer=%LAAnswer:~0,-1%
goto LAUnnecessary_Decimal_Point_Removal
) else (
exit /b
)








:LongDiv

if /i not "%1"=="" (
set LDa=%1
set LDb=%2
)

for /f "tokens=1,2 delims=." %%I in ("%LDa%") do (
set LDaBefore=%%I
Set LDaAfter=%%J0
)


for /f "tokens=1,2 delims=." %%I in ("%Ldb%") do (
set LDbBefore=%%I
set LDbAfter=%%J0
)

set LDMinusNumber=

if /i "%LDaBefore:~0,1%"=="-" if /i not "%LDbBefore:~0,1%"=="-" (
set LDMinusNumber=-
set LDaBefore=%LDaBefore:~1%
)

if /i "%LDbBefore:~0,1%"=="-" if /i not "%LDaBefore:~0,1%"=="-" (
set LDMinusNumber=-
set LDbBefore=%LDbBefore:~1%
)

if /i "%LDbBefore:~0,1%"=="-" if /i "%LDaBefore:~0,1%"=="-" (
set LDbBefore=%LDbBefore:~1%
set LDaBefore=%LDaBefore:~1%
)



set LDanswer=
set LDAns=
set LDrem=
set dpcount=0



set Var=LDa
call :LD_BNoughtLoop

set Var=LDb
call :LD_BNoughtLoop

Goto LD_LengthCheck

:LD_BNoughtLoop
if /i "!%var%After:~-1!"=="0" (
set %var%After=!%var%After:~0,-1!
goto LD_BNoughtLoop
)

exit /b


:LD_LengthCheck

if not defined LDaAfter set /a Lda_Length=0& goto LDb_LengthCheck

set var=LDa
set LD_offset=0
Call :LD_LengthLoop
Set LDa_Length=%LD_Offset%

:LDb_LengthCheck

if not defined LDbAfter set /a Ldb_Length=0& goto LD_FinishedChecks

set var=LDb
set LD_offset=0
Call :LD_LengthLoop
Set LDb_Length=%LD_Offset%


:LD_FinishedChecks

if /i %LDa_Length% equ %LDb_Length% (
Set LDa=%LdaBefore%%LdaAtfer%
Set LDb=%LdbBefore%%LdbAtfer%
goto LD_Start_Dividing
)

if /i %Lda_Length% gtr %Ldb_Length% (
set LD_Longer=LDa
set LD_Shorter=LDb
) Else (
set LD_Longer=LDb
set LD_Shorter=LDa
)

set /a LD_Length_diff= !%Ld_Longer%_Length! - !%LD_Shorter%_Length!

for /l %%I in (1,1,%LD_Length_diff%) do set %Ld_Shorter%After=!%Ld_Shorter%After!0

set LDa=%LdaBefore%%LdaAfter%
set LDb=%LdbBefore%%LdbAfter%
goto LD_Start_Dividing






:LD_LengthLoop
if /i not "!%var%After:~%LD_Offset%,1!"=="" (
set /a LD_offset= %LD_offset% + 1
goto LD_Lengthloop
)



exit /b




:LD_Start_Dividing

:LDa_fNoughtLoop
if /i "%Lda:~0,1%"=="0" (
set Lda=%Lda:~1%
goto LDa_fNoughtLoop
)

if not defined lda set lda=0

:LDb_fNoughtLoop
if /i "%Ldb:~0,1%"=="0" (
set Ldb=%Ldb:~1%
goto LDb_fNoughtLoop
)

if not defined ldb echo LongDivide Error: Cannot divide by zero!& exit /b

::4294967294

set DPcount=0

set /a LDans= %LDa% / %LDb%
set /a LDrem= %LDa%%%%LDb%

if /i %LDrem% equ 0 (
set LDanswer=%LDans%
goto LD_Finish_Answer
)

set LDanswer=%LDans%.

set /a LDa=%LDrem%0

:Long_Division_Loop

if /i "%DPCount%"=="%dp%" (
goto LD_Finish_Answer
)
set /a LDans= %LDa% / %LDb%
set LDAnswer=%LDanswer%%LDans%

set /a LDrem= %LDa%%%%LDb%
if /i %LDrem% equ 0 (
goto LD_Finish_Answer
)

set LDa=%LDrem%0
set /a DPCount=%DPCount% + 1
goto Long_Division_Loop


:LD_Finish_Answer
set dp=
set LDAnswer=%LDMinusNumber%%LdAnswer%
exit /b






:LongSub

set LSAnswer=
Set LSAfter=

for /f "tokens=1,2 delims=." %%I in ("%LS1%") do (
set LS1Before=%%I
Set LS1After=%%J0
)

for /f "tokens=1,2 delims=." %%I in ("%LS2%") do (
set LS2Before=%%I
set LS2After=%%J0
)

if /i %LS2Before% gtr %LS1Before% (
set LSMinusSign=-

set LS1Before=%LS2Before%
Set LS1After=%LS2After%

set LS2Before=%LS1Before%
Set LS2After=%LS1After%

)

if /i 1%LS2After% gtr 1%LS1After% (
set longer=LS2After
) ELSE (
set longer=LS1After
)

:LSAdd_Befores
Set /a LSBefore=%LS1Before% - %LS2Before% -0

set LongerL=1

:Find_Longer_Length
if /i not "!%Longer%:~%LongerL%,1!"=="" (
set /a LongerL= LongerL + 1
goto Find_Longer_Length
)

set /a LongerL= %LongerL% - 1

set minusone=

:LSAdd_Afters
set /a LSAfterDigit= %Minusone% + !LS1After:~%LongerL%,1! - !LS2After:~%LongerL%,1! -0


if /i %LSAfterDigit% lss 0 if /i "%LSBefore:~0,1%"=="-" set LSAfterDigit=%LSAfterdigit:~1%
if /i %LSAfterDigit% lss 0 (
set sparenought=
if /i "!LS1After:~%LongerL%,1!"=="" set sparenought=0
set /a LSAfterdigit= %Minusone% + 1!sparenought!!LS1After:~%LongerL%,1! - !LS2After:~%LongerL%,1! -0
set MinusOne=-1
) else (
set minusone=
)


set LSAfter=%LSAfterDigit%%LSAfter%
if /i %LongerL% leq 0 goto Finish_Answer
Set /a LongerL= %LongerL% - 1
goto LSadd_afters

:FindComp
set /a FindCompDigit= %LSadd% + 9 - !LSAfter:~%LSoffset%,1!
if /i %FindCompDigit% geq 10 (
set findCompDigit=%findcompdigit:~1%
set LSadd=1
) else (
set LSadd=
)
set LSComp=%FindCompDigit%%LSComp%
if /i !LSAfter:~%LSoffset%!==!LSAfter! (
set LSAfter=%LSComp%
exit /b
) else (
set /a LSOffset= %LSOffset% - 1
goto FindComp
)



:Finish_Answer
if /i %LSBefore% gtr 0 (
set /a LSBefore= %MinusOne% + %LSBefore%
) ELSE (
if "%minusone%"=="-1" if "%LSBefore%"=="0" set LSBefore=-0
)

if /i "%LSBefore%"=="-0" (
set LSOffset=-1
Set LSadd=1
call :FindComp
)

set LSAnswer=%LSMinusSign%%LSBefore%.%LSAfter%

:LSTrailingNoughts
if /i "%LSAnswer:~-1%"=="0" (
set LSAnswer=%LSAnswer:~0,-1%
goto LSTrailingNoughts
)

:LSUnnecessary_Decimal_Point_Removal
if /i "%LSAnswer:~-1%"=="." (
set LSAnswer=%LSAnswer:~0,-1%
goto LSUnnecessary_Decimal_Point_Removal
) else (
exit /b
)









:LongMul

if /i not "%1"=="" (
set LM1=%1
set LM2=%2
)


for /f "tokens=1,2 delims=." %%I in ("%LM1%") do (
set LM1Before=%%I
Set LM1After=%%J0
)


for /f "tokens=1,2 delims=." %%I in ("%LM2%") do (
set LM2Before=%%I
set LM2After=%%J0
)

Set LMMinusNumber=

if /i "%LM1Before:~0,1%"=="-" if /i not "%LM2Before:~0,1%"=="-" (
set LMMinusNumber=-
set LM1Before=%LM1Before:~1%
)

if /i "%LM2Before:~0,1%"=="-" if /i not "%LM1Before:~0,1%"=="-" (
set LMMinusNumber=-
set LM2Before=%LM2Before:~1%
)

if /i "%LM2Before:~0,1%"=="-" if /i "%LM1Before:~0,1%"=="-" (
set LM2Before=%LM2Before:~1%
set LM1Before=%LM1Before:~1%
)


if /i %LM1After% equ 0 (
set LM1After=0
goto LM2After_Process
)

set Var=LM1
set LM1TC=
set LMoffset=0
call :BNoughtLoop

:LM2After_Process

if /i %LM2After% equ 0 (
set LM2After=0
goto LM_Processes_Done
)

set Var=LM2
set LM2TC=
set LMoffset=0
call :BNoughtLoop

:LM_Processes_Done

set LMTotalTC=%LM1TC%%LM2TC%

goto LM_Start_Multiplying

:BNoughtLoop
if /i "!%var%After:~-1!"=="0" (
set %var%After=!%var%After:~0,-1!
goto BNoughtLoop
)

:LM_LengthLoop
if /i not "!%var%After:~%LMoffset%,1!"=="" (
set /a LMoffset= %LMoffset% + 1
set %var%TC=!%var%tc!0
goto LM_Lengthloop
)

:FNoughtLoop
if /i "!%var%After:~0,1!"=="0" (
set %var%After=!%var%After:~1!
goto FNoughtLoop
) Else (
exit /b
)




:LM_Start_Multiplying

set /a LM_1B_2B= %LM1Before% * %LM2Before%

set /a LM_1A_2A= %LM1After% * %LM2After%
Call :longdiv %LM_1A_2A% 1%LMTotalTC%

set LM_1A_2A=%LDAnswer%


set /a LM_1A_2B= %LM1After% * %LM2Before%
Call :longdiv %LM_1A_2B% 1%LM1TC%
set LM_1A_2B=%LDAnswer%



set /a LM_2A_1B= %LM2After% * %LM1Before%
Call :longdiv %LM_2A_1B% 1%LM2TC%
set LM_2A_1B=%LDAnswer%




:Start_Adding

call :longadd %LM_1B_2B% %LM_1A_2A%

set LMAnswer=%LAAnswer%

call :longadd %LMAnswer% %LM_1A_2B%

set LMAnswer=%LAAnswer%

call :longadd %LMAnswer% %LM_2A_1B%

Set LMAnswer=%LMMinusNumber%%LAAnswer%

exit /b
