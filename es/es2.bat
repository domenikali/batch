@echo off
title es 2

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
:sum
if %n% GTR 0 (
    set /a f=%f% * %n%
    set /a n=%n% - 1
    goto sum
)

echo "Il fattoriale e': %f%"