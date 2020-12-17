@echo off
setlocal
if not exist "C:\Program Files\Oracle\VirtualBox\" goto NotExist
:TheQuestion
echo Type the name of the macOS Virtual Machine
set /P vm=Virtual Machine:
echo --------------------
cd "C:\Program Files\Oracle\VirtualBox\"
echo Now Setting CPUIDset (1/6)
VBoxManage modifyvm "%vm%" --cpuidset 00000001 000306a9 04100800 7fbae3ff bfebfbff
if errorlevel 1 goto VMNotExist
echo Now Setting DmiSystemProduct (2/6)
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3"
echo Now Setting DmiSystemVersion (3/6)
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
echo Now Setting DmiBoardProduct (4/6)
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-2BD1B31983FE1663"
echo Now Setting DeviceKey (5/6)
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
echo Now Setting GetKeyFromRealSMC (6/6)
VBoxManage setextradata "%vm%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
echo --------------------
echo Finished!
timeout /t 10
exit

:VMNotExist
echo --------------------
echo The Virtual Machine you specified does not exist
pause
cls
goto TheQuestion

:NotExist
echo VirtualBox does not exist
pause
exit