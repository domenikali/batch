@echo off
title es 2

::echo 'ciao chaie'

::set /p string = "ciao"
set /a num = 6+9

set /a n = %num%*%num%

echo %n%


set /p string = ""

echo %string%

::input
::echo "inserisci un numero: "
::set /p n=""
::if "%n%"=="" goto input
::if %n% LSS 0 (
::    echo "Errore: Il numero deve essere >= 0"
::    echo.
::    goto input
::)

::set /a f=1
::sum
::if %n% GTR 0 (
::    set /a f=%f% * %n%
::    set /a n=%n% - 1
::    goto sum
::)

::echo "Il fattoriale e': %f%"