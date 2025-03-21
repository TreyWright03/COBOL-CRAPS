       IDENTIFICATION DIVISION.
       PROGRAM-ID. MENU.

       DATA DIVISION.
       WORKING-STORAGE SECTION.


       SCREEN SECTION.
       01 MENU-BOARD.
           05 BLANK SCREEN.
           05 LINE 3 COLUMN 10 VALUE " ________  ________  ________ ".
           05 LINE 3 COLUMN 40 VALUE " ________  ___                ".
           05 LINE 3 COLUMN 70 VALUE "                              ".
           05 LINE 3 COLUMN 100 VALUE "                              ".
           05 LINE 3 COLUMN 130 VALUE "                              ".
           05 LINE 4 COLUMN 10 VALUE "|\   ____\|\   __  \|\   __  \".
           05 LINE 4 COLUMN 40 VALUE "|\   __  \|\  \               ".
           05 LINE 4 COLUMN 70 VALUE "  __          ______          ".
           05 LINE 4 COLUMN 100 VALUE "                              ".
           05 LINE 4 COLUMN 130 VALUE "                              ".
           05 LINE 5 COLUMN 10 VALUE "\ \  \___|\ \  \|\  \ \  \|\ /".
           05 LINE 5 COLUMN 40 VALUE "\ \  \|\  \ \  \              ".
           05 LINE 5 COLUMN 70 VALUE " /  |        / _____| _       ".
           05 LINE 5 COLUMN 100 VALUE "          _                   ".
           05 LINE 5 COLUMN 130 VALUE "                              ".
           05 LINE 6 COLUMN 10 VALUE " \ \  \    \ \  \\\  \ \   __ ".
           05 LINE 6 COLUMN 40 VALUE " \ \  \\\  \ \  \             ".
           05 LINE 6 COLUMN 70 VALUE "/_/ |       ( (____ _| |_ ____".
           05 LINE 6 COLUMN 100 VALUE "_  ____ _| |_                 ".
           05 LINE 6 COLUMN 130 VALUE "                              ".
           05 LINE 7 COLUMN 10 VALUE "  \ \  \____\ \  \\\  \ \  \|\".
           05 LINE 7 COLUMN 40 VALUE "  \ \  \\\  \ \  \____        ".
           05 LINE 7 COLUMN 70 VALUE "  | |        \____ (_   _|____".
           05 LINE 7 COLUMN 100 VALUE " |/ ___|_   _)                ".
           05 LINE 7 COLUMN 130 VALUE "                              ".
           05 LINE 8 COLUMN 10 VALUE "   \ \_______\ \_______\ \____".
           05 LINE 8 COLUMN 40 VALUE "___\ \_______\ \_______\      ".
           05 LINE 8 COLUMN 70 VALUE "  | |        _____) )| |_/ ___".
           05 LINE 8 COLUMN 100 VALUE " | |     | |_                 ".
           05 LINE 8 COLUMN 130 VALUE "                              ".
           05 LINE 9 COLUMN 10 VALUE "    \|_______|\|_______|\|____".
           05 LINE 9 COLUMN 40 VALUE "___|\|_______|\|_______|      ".
           05 LINE 9 COLUMN 70 VALUE "  |_|    .  (______/  \__)____".
           05 LINE 9 COLUMN 100 VALUE "_|_|      \__|                ".
           05 LINE 9 COLUMN 130 VALUE "                              ".


           05 LINE 11 COLUMN 10 VALUE " ________  ________  ________ ".
           05 LINE 11 COLUMN 40 VALUE " ________  ________           ".
           05 LINE 11 COLUMN 70 VALUE "                              ".
           05 LINE 11 COLUMN 100 VALUE "                              ".
           05 LINE 11 COLUMN 130 VALUE "                              ".
           05 LINE 12 COLUMN 10 VALUE "|\   ____\|\   __  \|\   __  \".
           05 LINE 12 COLUMN 40 VALUE "|\   __  \|\   ____\          ".
           05 LINE 12 COLUMN 70 VALUE "______       _                ".
           05 LINE 12 COLUMN 100 VALUE "       _                ______".
           05 LINE 12 COLUMN 130 VALUE "                       _      ".
           05 LINE 13 COLUMN 10 VALUE "\ \  \___|\ \  \|\  \ \  \|\  ".
           05 LINE 13 COLUMN 40 VALUE "\ \  \|\  \ \  \___|_        (".
           05 LINE 13 COLUMN 70 VALUE "_____ \     | |               ".
           05 LINE 13 COLUMN 100 VALUE "      | |              (____  ".
           05 LINE 13 COLUMN 130 VALUE "\                     | |     ".
           05 LINE 14 COLUMN 10 VALUE " \ \  \    \ \   _  _\ \   __ ".
           05 LINE 14 COLUMN 40 VALUE " \ \   ____\ \_____  \        ".
           05 LINE 14 COLUMN 70 VALUE " ____) |    | |      _____ ___".
           05 LINE 14 COLUMN 100 VALUE "__  __| |_____  ____    ____) ".
           05 LINE 14 COLUMN 130 VALUE " | ___  _____  ____ __| |     ".
           05 LINE 15 COLUMN 10 VALUE "  \ \  \____\ \  \\  \\ \  \ \".
           05 LINE 15 COLUMN 40 VALUE "  \ \  \___|\|____|\  \       ".
           05 LINE 15 COLUMN 70 VALUE "/  ___/     | |     | ___ (___".
           05 LINE 15 COLUMN 100 VALUE "_ |/ _  | ___ |/ ___)  |  __  ".
           05 LINE 15 COLUMN 130 VALUE "( / _ \(____ |/ ___) _  |     ".
           05 LINE 16 COLUMN 10 VALUE "   \ \_______\ \__\\ _\\ \__\ ".
           05 LINE 16 COLUMN 40 VALUE "\__\ \__\     ____\_\  \     |".
           05 LINE 16 COLUMN 70 VALUE "  (____     | |_____| ____/ __".
           05 LINE 16 COLUMN 100 VALUE "_ ( (_| | ____| |      | |__) ".
           05 LINE 16 COLUMN 130 VALUE " ) |_| / ___ | |  ( (_| |     ".
           05 LINE 17 COLUMN 10 VALUE "    \|_______|\|__|\|__|\|__|\".
           05 LINE 17 COLUMN 40 VALUE "|__|\|__|    |\_________\     ".
           05 LINE 17 COLUMN 70 VALUE "\______) .  |_______)_____)___".
           05 LINE 17 COLUMN 100 VALUE "__|\____|_____)_|      |______".
           05 LINE 17 COLUMN 130 VALUE "/ \___/\_____|_|   \____|     ".
           05 LINE 18 COLUMN 10 VALUE "                              ".
           05 LINE 18 COLUMN 40 VALUE "             \|_________|     ".
           05 LINE 18 COLUMN 70 VALUE "                              ".
           05 LINE 18 COLUMN 100 VALUE "                              ".
           05 LINE 18 COLUMN 130 VALUE "                              ".


           05 LINE 20 COLUMN 10 VALUE " _____ ______   _______   ____".
           05 LINE 20 COLUMN 40 VALUE "____   ___  ___               ".
           05 LINE 20 COLUMN 70 VALUE "________     ______        _  ".
           05 LINE 20 COLUMN 100 VALUE "                              ".
           05 LINE 20 COLUMN 130 VALUE "                              ".
           05 LINE 21 COLUMN 10 VALUE "|\   _ \  _   \|\  ___ \ |\   ".
           05 LINE 21 COLUMN 40 VALUE "___  \|\  \|\  \             (".
           05 LINE 21 COLUMN 70 VALUE "_____  /    |  __  |      (_) ".
           05 LINE 21 COLUMN 100 VALUE " _                            ".
           05 LINE 21 COLUMN 130 VALUE "                              ".
           05 LINE 22 COLUMN 10 VALUE "\ \  \\\__\ \  \ \   __/|\ \  ".
           05 LINE 22 COLUMN 40 VALUE "\\ \  \ \  \\\  \             ".
           05 LINE 22 COLUMN 70 VALUE "  __) /     | |  | | _   _ _ _".
           05 LINE 22 COLUMN 100 VALUE "| |_                          ".
           05 LINE 22 COLUMN 130 VALUE "                              ".
           05 LINE 23 COLUMN 10 VALUE " \ \  \\|__| \  \ \  \_|/_\ \ ".
           05 LINE 23 COLUMN 40 VALUE " \\ \  \ \  \\\  \            ".
           05 LINE 23 COLUMN 70 VALUE " (___ \     | |  | || | | | (_".
           05 LINE 23 COLUMN 100 VALUE "   _)                         ".
           05 LINE 23 COLUMN 130 VALUE "                              ".
           05 LINE 24 COLUMN 10 VALUE "  \ \  \    \ \  \ \  \_|\ \ \".
           05 LINE 24 COLUMN 40 VALUE "  \\ \  \ \  \\\  \           ".
           05 LINE 24 COLUMN 70 VALUE "_____) |    | |__| || |_| | | ".
           05 LINE 24 COLUMN 100 VALUE "| |_                          ".
           05 LINE 24 COLUMN 130 VALUE "                              ".
           05 LINE 25 COLUMN 10 VALUE "   \ \__\    \ \__\ \_______\ ".
           05 LINE 25 COLUMN 40 VALUE "\__\\ \__\ \_______\         |".
           05 LINE 25 COLUMN 70 VALUE "______/  .   \______|____/|_| ".
           05 LINE 25 COLUMN 100 VALUE " \__|                         ".
           05 LINE 25 COLUMN 130 VALUE "                              ".
           05 LINE 26 COLUMN 10 VALUE "    \|__|     \|__|\|_______|\".
           05 LINE 26 COLUMN 40 VALUE "|__| \|__|\|_______|          ".
           05 LINE 26 COLUMN 70 VALUE "                              ".
           05 LINE 26 COLUMN 100 VALUE "                              ".
           05 LINE 26 COLUMN 130 VALUE "                              ".      
           
       PROCEDURE DIVISION.
           DISPLAY MENU-BOARD.
               