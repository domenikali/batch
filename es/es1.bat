@echo off
title es 1

:input
echo "inserisci un numero: "
set /p n=""
if "%n%"=="" goto input
if %n% LSS 0 (
    echo "Errore: Il numero deve essere >= 0"
    echo.
    goto input
)

set /a s=0
:sum
if %n% GTR 0 (
    set /a s=%s% + %n%
    set /a n=%n% - 1
    goto sum
)

echo "La somma e': %s%"
