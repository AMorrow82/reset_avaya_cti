@ECHO OFF

for /f "tokens=*" %%i in ('net user %USERNAME% /domain ^| FIND /I "Full Name"') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    set "line=!line:*Full Name=!"
    echo !line:~1! >> tmp.txt
    endlocal
) 

set /p VAR=<tmp.txt

echo Killing Avaya One X and CTI...
taskkill /f /im onexcui.exe
taskkill /f /im jp2launcher.exe
timeout /t 3

echo Restarting Avaya One X and CTI...
start C:\Users\%USERNAME%\"OneDrive - Knex"\Desktop\"Avaya one-X Communicator.lnk"
start C:\Users\%USERNAME%\"OneDrive - Knex"\Desktop\"CTIPhone.lnk"



msg %USERNAME% Avaya and CTI have been restarted. Please log back in, %VAR%
del tmp.txt

exit
