@echo off

setlocal enabledelayedexpansion

set outfile=namelist.txt
set /a count=10

if exist "%outfile%" del /q "%outfile%"

:loop
    echo %count%,
    set "random_name=%random%%random%%random%%random%"
    echo "file-!random_name!.txt" >> "%outfile%"
    set /a count-=1
    if %count% gtr 0 goto loop

echo done