# Steam Clicker Games Launcher
![enter image description here](pics/main_menu.png)

## Описание

**Steam Clicker Games Launcher** — это удобный инструмент для запуска и управления играми в Steam, специализирующийся на кликерных играх. Программа предоставляет простой и интуитивно понятный интерфейс, который позволяет запускать игры с различными параметрами, закрывать их и перезапускать Steam. Она поддерживает выполнение игр в фоновом режиме и может работать с несколькими играми одновременно.
## Пример меню

Главное меню программы выглядит следующим образом:

    ╔══════════════════════════════════════════════════════════════════════╗
    ║                        Steam Clicker Games Launcher                  ║
    ║                                by [Aksel]                            ║
    ╚══════════════════════════════════════════════════════════════════════╝
    
    [1] Запустить игры-Невидимка
    [2] Запустить обычные игры
    [3] Запустить все игры (Невидимка + обычные)
    [4] Запустить все игры (Все в обычном режиме)
    [5] Закрыть все игры
    [6] Перезапустить Steam
    [7] Запустить все игры по 10 на 5 минут
    [8] Выход из программы


## Основные функции

- **Запуск игр с параметрами**: Возможность запускать игры в фоновом режиме с определенными параметрами, такими как `-nographics`, `-headless`, `-batchmode`, `-force-d3d9` для игр, и без параметров для других игр.
- **Запуск всех игр**: Запускает все игры одновременно или в пакетном режиме, что позволяет гибко управлять игровым процессом.
- **Закрытие игр**: Закрывает все запущенные игры по ключевым словам процессов.
- **Перезапуск Steam**: Осуществляет перезапуск Steam при необходимости. (Через файл **Steam_Checker.bat**)
- **Пакетный запуск**: Поддержка запуска игр партиями по 10 игр с паузами, что позволяет управлять системными ресурсами.

## Как использовать

1. **Клонируйте репозиторий**:
    ```bash
    git clone https://github.com/yourusername/steam-clicker-games-launcher.git
    ```

2. **Запустите `EZ_FARM.bat`**:
    - Запустите файл `EZ_FARM.bat`, чтобы открыть главное меню программы.
    - Выберите нужное действие, используя числа от 1 до 8.

3. **Настройте параметры** (если необходимо):
    - Откройте файл `EZ_FARM.bat` в текстовом редакторе и отредактируйте следующие параметры:

### Настройка параметров

- **`game_ids`**: Список ID игр Steam, которые будут запускаться с параметрами `-nographics -headless -batchmode -force-d3d9`. Вы можете изменить или добавить ID игр в переменной `game_ids`.

    ```batch
    set "game_ids=3066470 3077790 2923300 3058700 3056550 3071740 3067770 3059840 2408310 2977660 3070890 3059750 3070500 3064950 3084990 3015610 3069620 3076520 3083270 3069470 3057940 3062750 2784840 3073680 1587070 2863000 2376170 3056370 3066830 3057850 3062260 3062410 1506810 3054490 3064160 3047030 3074340 3073460 3085950 3058250 3081700"
    ```

- **`special_game_ids`**: Список ID игр Steam, которые будут запускаться без дополнительных параметров. Вы можете изменить или добавить ID игр в переменной `special_game_ids`.

    ```batch
    set "special_game_ids=3056600 3070330 3046430 3077280 3058800 3080810 3090990 3059300 3056880 2996990 2794860 3048820 894060 2373450 3058030 3061500 3062030 3050630 3060300 3065090 3072100 3055390 3022740 3069990 3057390"
    ```

- **`game_keywords`**: Ключевые слова процессов для идентификации игр. Программа будет использовать эти ключевые слова для закрытия запущенных игр. Вы можете изменить или добавить ключевые слова в переменной `game_keywords`.

    ```batch
    set game_keywords=WARNING ThirdPersonTemplate Banana Bananametr Cats Cucumber Egg Melon Tapple Hamster Heart Meh Creature Clicker Beer Shrimp Flag Poop Clickout Emoji Carrot Raspberry Watermelon Duck DUCKS Clicker Giraffe jirafe Apple Mob Chick Cock Dog Coconut Lemon pizzeria Fruits Grow Honey Box Milk Crazy Corn Monsters POOP Avocado Orange The Watch Croissant Rod BUTT Spinners Clothing Car Banagine ButtonScore VHS Pizza Eggz WEEB Idle Coin Crypto Dollar Fish Just Potato Mushroom CAT Broccoli Banana-Shaped Rant Oh Gaggi Phat HawkTuah
    ```

- **`steam_path`**: Путь к исполняемому файлу Steam. Убедитесь, что указали правильный путь к `steam.exe` на вашей системе.

    ```batch
    set "steam_path=C:\Program Files (x86)\Steam\steam.exe"
    ```


### Список игр

| **ID**    | **Название**                   | **Режим**           |
|-----------|--------------------------------|---------------------|
| 3066470    | Apple                          | Невидимка           |
| 3077790    | Banana Gine                     | Невидимка           |
| 2923300    | Banana                          | Невидимка           |
| 3058700    | Banana Cat                      | Невидимка           |
| 3056550    | Bananamana                      | Невидимка           |
| 3071740    | Box Clicker                     | Невидимка           |
| 3067770    | BUTT                           | Невидимка           |
| 3059840    | Car Clicker                     | Невидимка           |
| 2408310    | Cat                            | Невидимка           |
| 2977660    | Cats                           | Невидимка           |
| 3070890    | Clothing                        | Невидимка           |
| 3059750    | Cock                            | Невидимка           |
| 3070500    | Coin                            | Невидимка           |
| 3064950    | Crazy Corn                      | Невидимка           |
| 3084990    | Crypto Rush                     | Невидимка           |
| 3015610    | Banana & Cucumber               | Невидимка           |
| 3069620    | Dog                             | Невидимка           |
| 3076520    | Dog                             | Невидимка           |
| 3083270    | Dogs                            | Невидимка           |
| 3069470    | Dollar                          | Невидимка           |
| 3057940    | Ducks                           | Невидимка           |
| 3062750    | DUCKS                           | Невидимка           |
| 2784840    | Egg                             | Невидимка           |
| 3073680    | Fish                            | Невидимка           |
| 1587070    | Fruits                          | Невидимка           |
| 2863000    | The Hamster                     | Невидимка           |
| 2376170    | Hamster Combat                  | Невидимка           |
| 3056370    | Honey Peach Clicker             | Невидимка           |
| 3066830    | Lemon                           | Невидимка           |
| 3057850    | Milk                            | Невидимка           |
| 3062260    | Monsters                        | Невидимка           |
| 3062410    | Pizzeria                        | Невидимка           |
| 1506810    | Poop                            | Невидимка           |
| 3054490    | Shrimp                          | Невидимка           |
| 3064160    | SPINNERS                        | Невидимка           |
| 3047030    | Tapple - Idle Clicker           | Невидимка           |
| 3074340    | VHS                             | Невидимка           |
| 3073460    | Broccoli                        | Невидимка           |
| 3085950    | Banana-Shaped                   | Невидимка           |
| 3058250    | Gaggi Clicker                   | Невидимка           |
| 3081700    | Hawk Tuah                       | Невидимка           |
| -------    | ----------                      | ---------           |
| 3056600    | Apple Clicker                   | Обычный режим       |
| 3070330    | Croissant                       | Обычный режим       |
| 3046430    | Hamster                         | Обычный режим       |
| 3077280    | Just Pizza                      | Обычный режим       |
| 3058800    | Orange - The Annoying Clicker   | Обычный режим       |
| 3080810    | Potato                          | Обычный режим       |
| 3090990    | Phat Phrog Clicker              | Обычный режим       |
| 3059300    | DOG                             | Обычный режим       |
| 3056880    | Emoji Clicker Collector         | Обычный режим       |
| 2996990    | Flag Clicker                    | Обычный режим       |
| 2794860    | Grow a Carrot                   | Обычный режим       |
| 3048820    | Raspberry                       | Обычный режим       |
| 894060     | Watch                           | Обычный режим       |
| 2373450    | Watermelon                      | Обычный режим       |
| 3058030    | WEEB                            | Обычный режим       |
| 3061500    | Mob Trader                      | Обычный режим       |
| 3062030    | Idle Kitties Online             | Обычный режим       |
| 3050630    | Melon                           | Обычный режим       |
| 3060300    | POOP                            | Обычный режим       |
| 3065090    | Meh                             | Обычный режим       |
| 3072100    | Lemon                           | Обычный режим       |
| 3055390    | Giraffe                         | Обычный режим       |
| 3022740    | Heart Clicker                   | Обычный режим       |
| 3069990    | RantCPU's ClickBait             | Обычный режим       |
| 3057390    | Banana Monkeys                  | Обычный режим       |


## Требования

- **Windows**: Работает на Windows 10 и выше.
- **Steam**: Установленный Steam клиент.

## Лицензия

Этот проект лицензирован под [MIT License](LICENSE).

