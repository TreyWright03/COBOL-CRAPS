       IDENTIFICATION DIVISION.
       PROGRAM-ID. BOARD.

       DATA DIVISION.
       WORKING-STORAGE SECTION.


       SCREEN SECTION.
       01 GUESSING-BOARD.
           05 BLANK SCREEN.
           05 LINE 2 COLUMN 7 VALUE " _____________________________".
           05 LINE 2 COLUMN 37 VALUE "______________________________".
           05 LINE 2 COLUMN 67 VALUE "_____________________________".
           05 LINE 3 COLUMN 7 VALUE "|     COBOL Casino Craps      ".
           05 LINE 3 COLUMN 37 VALUE "|                            |".
           05 LINE 3 COLUMN 67 VALUE "  Press 1 For Pass Bet       |".
           05 LINE 4 COLUMN 7 VALUE "|_____________________________".
           05 LINE 4 COLUMN 37 VALUE "|                            |".
           05 LINE 4 COLUMN 67 VALUE "  Press 2 For Dont Pass Bet  |".
           05 LINE 5 COLUMN 7 VALUE "|     Game Number:            ".
           05 LINE 5 COLUMN 37 VALUE "|                            |".
           05 LINE 5 COLUMN 67 VALUE "  Press 1 For Come Bet       |".
           05 LINE 6 COLUMN 7 VALUE "|_____________________________".
           05 LINE 6 COLUMN 37 VALUE "|                            |".
           05 LINE 6 COLUMN 67 VALUE "  Press 2 For Dont Come Bet  |".
           05 LINE 7 COLUMN 7 VALUE "|     Balance:                ".
           05 LINE 7 COLUMN 37 VALUE "|                            |".
           05 LINE 7 COLUMN 67 VALUE "  Press Enter To Roll Dice   |".
           05 LINE 8 COLUMN 7 VALUE "|_____________________________".
           05 LINE 8 COLUMN 37 VALUE "|____________________________|".
           05 LINE 8 COLUMN 67 VALUE "_____________________________|".
           05 LINE 9 COLUMN 7 VALUE "|                             ".
           05 LINE 9 COLUMN 37 VALUE "                              ".
           05 LINE 9 COLUMN 67 VALUE "                             |".
           05 LINE 10 COLUMN 7 VALUE "|_____________________________".
           05 LINE 10 COLUMN 37 VALUE "______________________________".
           05 LINE 10 COLUMN 67 VALUE "_____________________________|".
           
           05 LINE 12 COLUMN 20 VALUE "____________________".
           05 LINE 12 COLUMN 40 VALUE "____________________".
           05 LINE 12 COLUMN 60 VALUE "____________________".
           05 LINE 12 COLUMN 80 VALUE "__".
           05 LINE 13 COLUMN 16  VALUE "___/     |  DONT |       ".
           05 LINE 13 COLUMN 41 VALUE "|       |       |       ".
           05 LINE 13 COLUMN 65 VALUE "|       |        |".
           05 LINE 14 COLUMN 12 VALUE "___/   |     |  Come |_______".
           05 LINE 14 COLUMN 41 VALUE "|_______|_______|_______".
           05 LINE 14 COLUMN 65 VALUE "|_______|________|".
           05 LINE 15 COLUMN 12 VALUE "|      |  D  |  BAR  |   4   ".
           05 LINE 15 COLUMN 41 VALUE "|   5   |   6   |   8   ".
           05 LINE 15 COLUMN 65 VALUE "|   9   |   10   |".
           05 LINE 16 COLUMN 12 VALUE "|  P   |  P  |_______|_______".
           05 LINE 16 COLUMN 41 VALUE "|_______|_______|_______".
           05 LINE 16 COLUMN 65 VALUE "|_______|________|".
           05 LINE 17 COLUMN 12 VALUE "|  A   |     |               ".
           05 LINE 17 COLUMN 41 VALUE "____                    ".
           05 LINE 17 COLUMN 65 VALUE "                  \".
           05 LINE 18 COLUMN 12 VALUE "|  S   |  B  |              /".
           05 LINE 18 COLUMN 41 VALUE " ___|___  _ __ ___   ___".
           05 LINE 18 COLUMN 65 VALUE "                  |".
           05 LINE 19 COLUMN 12 VALUE "|  S   |  A  |             | ".
           05 LINE 19 COLUMN 41 VALUE "|   / _ \| '_ ` _ \ / _ ".
           05 LINE 19 COLUMN 65 VALUE "\                 |".
           05 LINE 20 COLUMN 12 VALUE "|      |  R  |             | ".
           05 LINE 20 COLUMN 41 VALUE "|__| (_) | | | | | |  __".
           05 LINE 20 COLUMN 65 VALUE "/                 |".
           05 LINE 21 COLUMN 12 VALUE "|  L   |     |              \".
           05 LINE 21 COLUMN 41 VALUE "____\___/|_| |_| |_|\___".
           05 LINE 21 COLUMN 65 VALUE "|                 |".
           05 LINE 22 COLUMN 12 VALUE "|  I   |_____|_______________".
           05 LINE 22 COLUMN 41 VALUE "________________________".
           05 LINE 22 COLUMN 65 VALUE "__________________|".
           05 LINE 23 COLUMN 12 VALUE "|  N   |     \_             -".
           05 LINE 23 COLUMN 41 VALUE " 4 - 5 - 6 - 7 - 8 - 9 -".
           05 LINE 23 COLUMN 65 VALUE " 10 -             |".
           05 LINE 24 COLUMN 12 VALUE "|  E   |   6   \_   2  -  3  ".
           05 LINE 24 COLUMN 41 VALUE "         F I E L D      ".
           05 LINE 24 COLUMN 65 VALUE "      11 - 12     |".
           05 LINE 25 COLUMN 12 VALUE "|       \_       \___________".
           05 LINE 25 COLUMN 41 VALUE "________________________".
           05 LINE 25 COLUMN 65 VALUE "__________________|".
           05 LINE 26 COLUMN 12 VALUE " \_       \_   8  |          ".
           05 LINE 26 COLUMN 41 VALUE "     DONT  PASS  BAR    ".
           05 LINE 26 COLUMN 65 VALUE "                  |".
           05 LINE 27 COLUMN 12 VALUE "   \_       \_____|__________".
           05 LINE 27 COLUMN 41 VALUE "________________________".
           05 LINE 27 COLUMN 65 VALUE "__________________|".
           05 LINE 28 COLUMN 12 VALUE "     \_                .---..".
           05 LINE 28 COLUMN 41 VALUE "---..---..---. .-.   .-.".
           05 LINE 28 COLUMN 65 VALUE ".-..-..---.       |".
           05 LINE 29 COLUMN 12 VALUE "       \_              | |-'|".
           05 LINE 29 COLUMN 41 VALUE " | | \ \  \ \  | |__ | |".
           05 LINE 29 COLUMN 65 VALUE "| .` || |-        |".
           05 LINE 30 COLUMN 12 VALUE "         \_            `-'  `".
           05 LINE 30 COLUMN 41 VALUE "-^-'`---'`---' `----'`-'".
           05 LINE 30 COLUMN 65 VALUE "`-'`-'`---'       |".
           05 LINE 31 COLUMN 12 VALUE "           \_________________".
           05 LINE 31 COLUMN 41 VALUE "________________________".
           05 LINE 31 COLUMN 65 VALUE "__________________|".
           
       PROCEDURE DIVISION.
           DISPLAY GUESSING-BOARD.
               