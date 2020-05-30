@echo off
setlocal enabledelayedexpansion

::~~~~~~~~~~~~ Start of menu system.



echo ScrewTheLotOfYou's Random Generation Tool
echo.
echo.
echo.
echo Enter 1 for Random Chance Generator or 2 for Random Number Generator
:Ask_Choice
set /p choice=
if /i %choice% equ 1 goto RandomChance
if /i %choice% equ 2 goto RandomNumber
goto Ask_Choice








::~~~~~~~~~~~~ Start of Random Chance.

:Randomchance
echo Generates a 1 for positive and a 0 for negative.

:Enter_Numerator
echo Enter the numerator
set /p numerator=

if /i "%Numerator%" leq "¬" goto Enter_Numerator
if /i "%Numerator%" geq "a" goto Enter_Numerator

:Enter_Denominator
echo Enter the denominator
set /p Denominator=

if /i "%Denominator%" leq "¬" goto Enter_Denominator
if /i "%Denominator%" geq "a" goto Enter_Denominator


::~~~~~~~~~~~~ All the code in the Random Chance Generator up to this point can be removed if you set the denominator and numerator in the code here.


::~~~~~~~~~~~~ This random chance generator works as if you are entering a fraction. The numerator is the top of the fraction, the denominator is the bottom.
::~~~~~~~~~~~~ If you enter 2 as the numerator and 3 as the denominator, there will be a two out of three chance of a positive result.

:Generate_Chance
set /a chanceVar= %random% %% %Denominator%
if /i %chanceVar% lss %Numerator% (Set ResultOfChance=1) else (Set ResultOfChance=0)

::~~~~~~~~~~~~~ CONTINUE YOUR WORK HERE. I am simply echoing the results and looping.

echo %ResultOfChance%

goto Generate_Chance






::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







::~~~~~~~~~~~~ Start of Random Number Generator.




:RandomNumber

:EnterMinVal
echo Enter the minimum value the number can take.
set /p minval=
if /i "%minval%" leq "¬" goto EnterMinVal
if /i "%minval%" geq "a" goto EnterMinVal

:EnterMaxVal
echo Enter the maximum value the number can take.
set /p maxval=
if /i "%maxval%" leq "¬" goto EnterMaxVal
if /i "%maxval%" geq "a" goto EnterMaxVal

if /i %minval% gtr %maxval% echo Minimum value can not be smaller than maximum value.& goto RandomNumber
if /i %maxval% gtr 62767 echo Maximum value too high.

::~~~~~~~~~~~~ All the code in the Random Number Generator can be removed up to this point if you set maxval and minval values here in the code.


set /a ValRange= ( %MaxVal% - %MinVal% ) + 1

:NumberGenerator
set /a RandomNumber= ( %random% %% %ValRange% ) + %MinVal%

::~~~~~~~~~~~~ CONTINUE YOUR WORK HERE. I am simply echoing the result and looping.

echo %RandomNumber%
goto NumberGenerator


pause