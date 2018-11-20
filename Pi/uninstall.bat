@echo off

tasklist /nh /fi "imagename eq M4.exe" | find /i "M4.exe" >nul && (
goto end1
) || (
goto con
)


:con

tasklist /nh /fi "imagename eq Pi.exe" | find /i "Pi.exe" >nul && (
goto end1
) || (
goto con1
)

:end1
echo MSGBOX "Pi is still running,please close and try again!",vbCritical, "Error"  > %temp%\TEMPmessage.vbs
call %temp%\TEMPmessage.vbs
del %temp%\TEMPmessage.vbs /f /q
exit

:con1

ver | findstr /i "5\.0\."
if %ERRORLEVEL% EQU 0 (
::echo  OS = Windows 2000
cmd /c rmdir /s /q "%USERPROFILE%\Local Settings\Application Data\PI"
)
ver | findstr /i "5\.1\."
if %ERRORLEVEL% EQU 0 (
::echo OS = Windows XP
cmd /c rmdir /s /q "%USERPROFILE%\Local Settings\Application Data\PI"
)
ver | findstr /i "5\.2\."
if %ERRORLEVEL% EQU 0 (
::echo OS = Server 2003
cmd /c rmdir /s /q "%USERPROFILE%\Local Settings\Application Data\PI"
)
ver | findstr /i "6\.0\." > nul
if %ERRORLEVEL% EQU 0 (
::echo OS = Vista / Server 2008
cmd /c rmdir /s /q "%USERPROFILE%\Local Settings\Application Data\PI"
)
ver | findstr /i "6\.1\." > nul
if %ERRORLEVEL% EQU 0 (
::echo OS = Windows 7 / Server 2008R2
cmd /c rmdir /s /q %userprofile%\AppData\Local\PI
)
ver | findstr /i "6\.2\." > nul
if %ERRORLEVEL% EQU 0 (
::echo OS = Windows 8 / Server 2012
cmd /c rmdir /s /q %userprofile%\AppData\Local\PI
)
ver | findstr /i "6\.3\." > nul
if %ERRORLEVEL% EQU 0 (
::echo OS = Windows 8.1 / Server 2012R2
cmd /c rmdir /s /q %userprofile%\AppData\Local\PI
)


cmd /c msiexec /x {AF6D353A-B1BE-4A56-BA7D-19E3FD9CF0B4}