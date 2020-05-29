@echo off
:This Program patches the autorun.inf to prevent shortcut virus.
setlocal
title USB Vaccine

:TheQuestion
cls
echo Type your flash drive letter.
CHOICE /c:defghijklmnopqrstuvwxyz /n /m "Flash Drive:"
if errorlevel 23 set DriveLetter=Z
if errorlevel 22 set DriveLetter=Y
if errorlevel 21 set DriveLetter=X
if errorlevel 20 set DriveLetter=W
if errorlevel 19 set DriveLetter=V
if errorlevel 18 set DriveLetter=U
if errorlevel 17 set DriveLetter=T
if errorlevel 16 set DriveLetter=S
if errorlevel 15 set DriveLetter=R
if errorlevel 14 set DriveLetter=Q
if errorlevel 13 set DriveLetter=P
if errorlevel 12 set DriveLetter=O
if errorlevel 11 set DriveLetter=N
if errorlevel 10 set DriveLetter=M
if errorlevel 9 set DriveLetter=L
if errorlevel 8 set DriveLetter=K
if errorlevel 7 set DriveLetter=J
if errorlevel 6 set DriveLetter=I
if errorlevel 5 set DriveLetter=H
if errorlevel 4 set DriveLetter=G
if errorlevel 3 set DriveLetter=F
if errorlevel 2 set DriveLetter=E
if errorlevel 1 set DriveLetter=D
if %ErrorLevel% LEQ 23 goto CheckIfTheDriveExist

:CheckIfTheDriveExist
cls
If EXIST %DriveLetter%:\ (goto CheckIfTheVaccineExist) ELSE (goto NotExist)

:CheckIfTheVaccineExist
If EXIST %DriveLetter%:\autorun.inf\con (goto Antidote) ELSE (goto Vaccine)

:NotExist
echo The drive is not existing.
pause
goto TheQuestion

:Vaccine
echo Do you want to Vaccine this drive?
echo Y=Yes N=No
CHOICE /c:yn /n /m Choice:
if errorlevel 2 goto TheQuestion
if errorlevel 1 goto StartVaccine

:Antidote
echo Do you want to Remove Vaccine on this drive?
echo Y=Yes N=No
CHOICE /c:yn /n /m Choice:
if errorlevel 2 goto TheQuestion
if errorlevel 1 goto StartAntidote

:StartVaccine
cls
%DriveLetter%:
mkdir autorun.inf
attrib +h +r +s +a autorun.inf
cd autorun.inf
mkdir .\con\
echo Finished!
pause
goto TheQuestion

:StartAntidote
cls
%DriveLetter%:
cd autorun.inf
rmdir .\con\
cd %DriveLetter%:\
attrib -h -r -s -a autorun.inf
rmdir autorun.inf
echo Finished!
pause
goto TheQuestion