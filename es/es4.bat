@echo off
title es 4

:input
echo "inserisci un numero: "
set /p n=""
if "%n%"=="" goto input
if %n% LSS 0 (
    echo "Errore: Il numero deve essere >= 0"
    echo.
    goto input
)

set /a f=1
:seq
if %n% GTR 0 (
    echo %f% 
    set /a n=%n% - 1
    set /a f=%f% +1
    goto seq
)

echo.