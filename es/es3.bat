@echo off
title es 2

:input1
echo "inserisci la base: "
set /p n1=""
if "%n1%"=="" goto input1
if %n1% LSS 0 (
    echo "Errore: Il numero deve essere >= 0"
    echo.
    goto input1
)

:input2
echo "inserisci l'esponente: "
set /p n2=""
if "%n2%"=="" goto input2
if %n2% LSS 0 (
    echo "Errore: Il numero deve essere >= 0"
    echo.
    goto input2
)

set /a r=1
:pow
if %n2% GTR 0 (
    set /a r=%r% * %n1%
    set /a n2=%n2% - 1
    goto pow
)

echo "Il risultato e': %r%"