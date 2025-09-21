@echo off
title BBFix v0.1 Admin

:: --- Auto-elevate using VBScript ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrator privileges...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~f0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    cscript //nologo "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /b
)

:: --- Confirm admin rights ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Could not get Administrator rights. Exiting...
    pause
    exit /b
)

:: --- Original warning ---
echo -This process will remove the black boxes on your desktop.
echo Your desktop will disappear for a moment, it will be back to normal.
echo Do not close it until it finishes.
pause
cls

:: --- Kill Explorer ---
echo -Closing Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 >nul
echo -Closed.

:: --- Remove Thumbnails ---
echo -Removing Thumbnails...
set "errorFound=0"

for %%F in (%LocalAppData%\Microsoft\Windows\Explorer\*.db) do (
    del /f /q %%F >nul 2>&1
    if exist %%F (
        echo Error: Could not delete %%F
        set "errorFound=1"
    )
)

if %errorFound%==1 (
    echo -Some thumbnails could not be removed! This is normal for some locked system files.
) else (
    echo -Thumbnails Removed.
)

:: --- Restart Explorer ---
echo -Starting Windows Explorer...
start explorer.exe
echo -Started.

echo -The Operation Completed Successfully! The black boxes should now disappear.
echo -Closing in 5 seconds...
timeout /t 5 >nul
exit
