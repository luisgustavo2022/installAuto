@echo off
setlocal
set _wu=%SystemRoot%\System32\WUAPP.exe
set _wuclt=%SystemRoot%\System32\wuauclt.exe
set _wuaueng=%SystemRoot%\System32\wuaueng.dll
set _wuaust=%SystemRoot%\System32\wuauserv.dll
set _wuapi=%SystemRoot%\System32\wuapi.dll
set _wudriver=%SystemRoot%\System32\wudriver.dll
set _wups=%SystemRoot%\System32\wups.dll
set _wups2=%SystemRoot%\System32\wups2.dll
set _wuweb=%SystemRoot%\system32\wuwebv.dll

echo Searching for updates...
%_wu% startmenu

echo Installing updates...
%_wuclt% /detectnow /updatenow

echo Waiting for updates to install...
timeout /t 600 /nobreak

echo Verifying update status...

REM Check if Windows Update service is running
sc query wuauserv | find "RUNNING"
if errorlevel 1 (
    echo Updates were not installed successfully.
    echo Please make sure the Windows Update service is running and try again.
) else (
    echo Updates installed successfully.
)

echo Press any key to restart...
pause
shutdown.exe /r /t 00
