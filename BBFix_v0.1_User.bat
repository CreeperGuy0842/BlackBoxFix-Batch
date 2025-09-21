@echo off
title BBFix v0.1 User (non-admin)

echo -This process will remove the black boxes on your desktop.
echo Your desktop will disappear for a moment, it will be back to normal.
echo Do not close it until it finishes.
pause
cls

echo -Closing Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1

:: Wait a moment for Explorer to release handles
timeout /t 2 >nul
echo -Closed.



echo -Removing Thumbnails...

set "errorFound=0"
for %%F in ("%LocalAppData%\Microsoft\Windows\Explorer\*.db") do (
    del /f /q "%%F" >nul 2>&1
    if exist "%%F" (
        echo Error: Could not delete %%F
        set "errorFound=1"
    )
)

if %errorFound%==1 (
    echo -Some thumbnails could not be removed! This is normal for some locked system files.
) else (
    echo -Thumbnails Removed.
)

echo -Starting Windows Explorer...
start explorer.exe
echo -Started.

echo -The Operation Completed Successfully! The black boxes should now disappear.
echo -Closing in 5 seconds...
timeout /t 5 >nul
exit
