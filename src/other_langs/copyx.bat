@echo off

if "%~1%" == "" (
    goto help
) else if "%~2%" == "" (
    goto help
) else if "%~3%" == "" (
    goto help
) else if not exist "%1" (
    echo '%1' file not found.
    goto xxx
) else (
    echo.
)

setlocal EnableDelayedExpansion

set source_file=%~1%
set ext=%~x1
set destination_dir=%~2% 
set csv_file=%~3%
set hr=%time:~0,2%
if "%hr:~0,1%" == " " SET hr=0%hr:~1,1%
set log_file=%date:~12,2%%date:~4,2%%date:~7,2%_%hr%%time:~3,2%%time:~6,2%.log

if not exist "%destination_dir%" md "%destination_dir%"

for /f "tokens=*" %%a in (%csv_file%) do (
    set new_name=%%a
    :: set source_file=%source_dir%\%new_name%
    set destination_file=%destination_dir:~0,-1%\!new_name:~0,-1!%ext%
    
    :: echo "!destination_file!" "%log_file%"
    copy /y "%source_file%" "!destination_file!"

    if %ERRORLEVEL% neq 0 (
        echo failed, copy to !destination_file! >> !log_file!
        goto xxx
    ) else (
        echo done, copy to "!destination_file!" >> !log_file!
    )
)

echo done %date% %time%
goto xxx

:help
echo Copy a file into a directory by using the pre-defined filenames in a filename list.
echo.
echo %0  [drive:][path]copied_filename  [drive:][path]to_directory  [drive:][path]list_filename
echo.
echo Example: %0 copy_me.txt TO_DIR by_namelist.csv
echo.
echo Note that the list of filenames can be created by GENNAME.bat

:xxx
setlocal DisableDelayedExpansion
echo.
