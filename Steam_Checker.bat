:: Файл: steam_checker.bat

@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title Steam Checker by [ Aksel ]

set "steam_path=%~1"
set "game_ids=%~2"
set "game_keywords=%~3"

:check_loop
call :check_steam_processes
timeout /t 60 >nul
goto check_loop

:check_steam_processes
set "steam_processes=steam.exe steamservice.exe steamwebhelper.exe"
set "steam_running=true"
for %%p in (%steam_processes%) do (
    tasklist /FI "IMAGENAME eq %%p" 2>NUL | find /I /N "%%p" >NUL
    if errorlevel 1 (
        set "steam_running=false"
    )
)

if "%steam_running%"=="false" (
    echo.
	echo [WARNING] Steam не запущен. Перезапуск Steam и игр...
    call :close_games
    start "" "%steam_path%"
    timeout /t 10 >nul
    call :launch_invisible_games
)
exit /b

:close_games
echo Закрытие всех игр...
for %%i in (%game_keywords%) do (
    taskkill /F /FI "IMAGENAME eq %%i*"
)
echo Все игры закрыты.
exit /b

:launch_invisible_games
echo Запуск игр-невидимок...
set "params=-nographics -headless -batchmode -force-d3d9"
for %%i in (%game_ids%) do (
    start "" /LOW "%steam_path%" -applaunch %%i %params%
    timeout /t 10 >nul
)
echo Игры-невидимки запущены.
exit /b
