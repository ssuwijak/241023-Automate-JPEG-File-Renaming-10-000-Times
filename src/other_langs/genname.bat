@echo off

if "%~1%" == "" (
    goto help
) else if "%~2%" == "" (
    goto help
) else if "%~3%" == "" (
    goto help
) else (
    echo.
)

setlocal enabledelayedexpansion

set outfile=%~1%
set /a count=%~2%
set prefix=%~3%

if exist "%outfile%" del "%outfile%"

:loop
    echo | set /p=%count%, 
    set "random_name=%random%%random%%random%%random%"
    echo %prefix%!random_name! >> "%outfile%"
    set /a count-=1
    if %count% gtr 0 goto loop

echo done
:: goto xxx
echo.
echo display some of the first lines in '%outfile%':
set /a count=5

for /f "tokens=*" %%a in (%outfile%) do (
    set /a count-=1
    echo   %%a
    if !count! leq 0 goto :xxx
)

:help
echo Generates a number of filenames randomly into a file by any defined filename pattern.
echo.
echo %0  [drive:][path]output_file  number  prefix_pattern
echo.
echo Example: %0 namelist.csv 10 prefix-

:xxx
setlocal DisableDelayedExpansion
echo.
