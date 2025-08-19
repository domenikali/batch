@echo off
title es 5

:input
echo "inserisci un numero: "
set /p n=""
if "%n%"=="" goto input
if %n% LSS 0 (
    echo "Errore: Il numero deve essere >= 0"
    echo.
    goto input
)

if %n% lss 0 (
    echo "errore"
    exit 0
)
if %n% GTR 100 (
    echo "errore"
    exit 0
)

if %n% GTR 18 (
    echo "maggiorenne"
)
if %n% LSS 18 (
    echo "minorenne"
)
echo.