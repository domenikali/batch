@echo off
title es 5

:input
echo "inserisci nome dir: "
set /p n=""
if "%n%"=="" goto input

mkdir "%n%"
echo.