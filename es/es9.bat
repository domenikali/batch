@echo off

echo "Cartella backup da eliminare: "
set /p cartella=""

if not exist "%cartella%" (
    echo ERRORE: Cartella non trovata
    pause
    exit 1
)

rmdir "%cartella%" /s /q

if %ERRORLEVEL% EQU 0 (
    echo Backup eliminato con successo
) else (
    echo Errore durante l'eliminazione del backup
)
pause
