@echo off
echo "Cartella da backuppare: "
set /p cartella=""

if not exist "%cartella%" (
    echo ERRORE: Cartella non trovata
    pause
    exit 1
)

set "backup=backup_%date:~-4,4%%date:~-10,2%%date:~-7,2%"
mkdir "%backup%" 2>nul

copy "%cartella%\*" "%backup%\" 
if %ERRORLEVEL% EQU 0 (
    echo Backup completato con successo
) else (
    echo Errore durante il backup
)
pause
