@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title Steam Clicker Games Launcher by [Aksel]

:: Настройки цветов
color 0A

:: ID игр с параметрами: -nographics -headless -batchmode -force-d3d9
set "game_ids=3066470 3077790 2923300 3058700 3056550 3071740 3067770 3059840 2408310 2977660 3070890 3059750 3070500 3064950 3084990 3015610 3069620 3076520 3083270 3069470 3057940 3062750 2784840 3073680 1587070 2863000 2376170 3056370 3066830 3057850 3062260 3062410 1506810 3054490 3064160 3047030 3074340 3073460 3085950 3058250 3081700"

:: ID игр с параметрами: -screen-fullscreen 0 -quality 0 (Пока вообще без параметров)
set "special_game_ids=3056600 3070330 3046430 3077280 3058800 3080810 3090990 3059300 3056880 2996990 2794860 3048820 894060 2373450 3058030 3061500 3062030 3050630 3060300 3065090 3072100 3055390 3022740 3069990 3057390"

:: Ключевые слова процессов игр
set game_keywords=WARNING ThirdPersonTemplate Banana Bananametr Cats Cucumber Egg Melon Tapple Hamster Heart Meh Creature Clicker Beer Shrimp Flag Poop Clickout Emoji Carrot Raspberry Watermelon Duck DUCKS Clicker Giraffe jirafe Apple Mob Chick Cock Dog Coconut Lemon pizzeria Fruits Grow Honey Box Milk Crazy Corn Monsters POOP Avocado Orange The Watch Croissant Rod BUTT Spinners Clothing Car Banagine ButtonScore VHS Pizza Eggz WEEB Idle Coin Crypto Dollar Fish Just Potato Mushroom CAT Broccoli Banana-Shaped Rant Oh Gaggi Phat HawkTuah

:: Путь к steam.exe (укажите правильный путь, если требуется)
set "steam_path=C:\Program Files (x86)\Steam\steam.exe"

:: Запуск фонового процесса для проверки Steam
start "" /B steam_checker.bat "%steam_path%" "%game_ids%" "%game_keywords%"

:: Главное меню
:main_menu
cls
echo.
echo    ╔══════════════════════════════════════════════════════════════════════╗
echo    ║                        Steam Clicker Games Launcher                  ║
echo    ║                                by [Aksel]                            ║
echo    ╚══════════════════════════════════════════════════════════════════════╝
echo.
call :check_steam_status
echo.
echo    [1] Запустить игры-невидимки
echo    [2] Запустить обычные игры
echo    [3] Запустить все игры (Невидимки + обычные)
echo    [4] Запустить все игры (Все в обычном режиме)
echo    [5] Закрыть все игры
echo    [6] Перезапустить Steam
echo    [7] Запустить все игры по 10 на 5 минут
echo    [8] Выход из программы
echo.

echo Выберите пункт меню на клавиатуре (1-8):
choice /C 12345678 /M "--->"
set choice=%errorlevel%
echo Вы выбрали пункт меню: [%choice%]

if "%choice%"=="1" (
    set "params=-nographics -headless -batchmode -force-d3d9"
    set "games=%game_ids%"
    set "total_games=0"
    for %%i in (%game_ids%) do set /a "total_games+=1"
    call :launch_games !total_games!
)
if "%choice%"=="2" (
    set "params="
    set "games=%special_game_ids%"
    set "total_games=0"
    for %%i in (%special_game_ids%) do set /a "total_games+=1"
    call :launch_games !total_games!
)
if "%choice%"=="3" (
    set "params=-nographics -headless -batchmode -force-d3d9"
    set "games=%game_ids%"
    set "total_games=0"
    for %%i in (%game_ids%) do set /a "total_games+=1"
    call :launch_games !total_games!
    set "params="
    set "games=%special_game_ids%"
    for %%i in (%special_game_ids%) do set /a "total_games+=1"
    call :launch_games !total_games!
)
if "%choice%"=="4" (
    set "params="
    set "games=%game_ids% %special_game_ids%"
    set "total_games=0"
    for %%i in (%game_ids% %special_game_ids%) do set /a "total_games+=1"
    call :launch_games !total_games!
)
if "%choice%"=="5" goto close_games
if "%choice%"=="6" goto restart_steam
if "%choice%"=="7" goto launch_games_in_batches
if "%choice%"=="8" goto end

goto main_menu

:launch_games
call :section_header "Запуск игр" %1
set "count=0"
for %%i in (%games%) do (
    set /a "count+=1"
    echo Запускаю игру с Steam ID: %%i...
    echo Прогресс: !count!/%1
    start "" /LOW "%steam_path%" -applaunch %%i %params%
    timeout /t 10 >nul
)
echo Игры успешно запущены!
echo Нажмите любую клавишу, чтобы вернуться в меню...
pause
goto main_menu

:launch_games_in_batches
set "params="
set "games=%game_ids% %special_game_ids%"
set "total_games=0"
for %%i in (%game_ids% %special_game_ids%) do set /a "total_games+=1"
set "count=0"
set "batch_size=10"
set "batch_games="
for %%i in (%games%) do (
    set /a "count+=1"
    set "batch_games=!batch_games! %%i"
    if !count! geq !batch_size! (
        call :launch_batch "!batch_games!"
        timeout /t 300 >nul
        call :close_batch "!batch_games!"
        set "count=0"
        set "batch_games="
    )
)
if !count! gtr 0 (
    call :launch_batch "!batch_games!"
    timeout /t 300 >nul
    call :close_batch "!batch_games!"
)
goto main_menu

:launch_batch
for %%i in (%~1) do (
    echo Запускаю игру с Steam ID: %%i...
    start "" /LOW "%steam_path%" -applaunch %%i %params%
)
exit /b

:close_batch
for %%i in (%~1) do (
    for %%j in (%game_keywords%) do (
        taskkill /F /FI "IMAGENAME eq %%j*"
    )
)
exit /b

:section_header
echo.
echo ===============================================
echo %~1
echo Всего игр: %~2
echo ===============================================
exit /b

:close_games
for %%i in (%game_keywords%) do (
    taskkill /F /FI "IMAGENAME eq %%i*"
)
echo Все игры успешно закрыты!
goto main_menu

:restart_steam
echo Перезапуск Steam...
taskkill /F /IM steam.exe
taskkill /F /IM steamservice.exe
taskkill /F /IM steamwebhelper.exe
timeout /t 2 >nul
start "" "%steam_path%"
echo Steam перезапущен.
timeout /t 5 >nul
goto main_menu

:end
echo Завершение работы фонового процесса...
taskkill /F /FI "WINDOWTITLE eq Steam Checker*"
echo Спасибо за использование Steam Clicker Games Launcher!
timeout /t 3 >nul
exit /b

:check_steam_status
tasklist /FI "IMAGENAME eq steam.exe" 2>NUL | find /I /N "steam.exe" >NUL
if errorlevel 1 (
    echo    [Steam не запущен]
) else (
    echo    [Steam работает нормально]
)
exit /b
