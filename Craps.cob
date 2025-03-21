       IDENTIFICATION DIVISION.
       PROGRAM-ID. CRAPS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT highscore-file ASSIGN TO "highscore.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FILE-STATUS.
       
       DATA DIVISION.
       FILE SECTION.
       FD highscore-file.
       01 highscore-file-out.
           02 high-name PIC XXX.
           02 high-score PIC 99999.
       WORKING-STORAGE SECTION.

       01 file-status      pic 99.

       01 USER-CHOICE      PIC 999.
       01 user-name        pic XXX.
       01 USER-ROLL-CHOICE PIC 999.
       01 DIE1             PIC 9.
       01 DIE2             PIC 9.
       01 diceTotal        PIC 99 VALUE 0.
       01 MENUCHOICE       PIC 9 VALUE 0.
       01 point            PIC 99.

       01 PLAY-AGAIN       PIC X VALUE 'Y'.

       01 doub             PIC 9 VALUE 2.
       01 win              PIC X VALUE 'N'.
       01 rollAgain        PIC X VALUE 'Y'.
       01 rollAgainCounter PIC 99 VALUE 1.
       01 passLineBet      PIC X VALUE 'N'.
       01 DontpassLineBet  PIC X VALUE 'N'.
       01 Comebet          PIC X VALUE 'N'.
       01 Dontcomebet      PIC X VALUE 'N'.
       01 validBet         PIC X VALUE 'N'.
       01 pointCheck       PIC X VALUE 'N'.
       01 bAmou            PIC 999.
       01 cbAm             PIC 999.
       01 cbAmTot          PIC 999.
       01 dcbAm            PIC 999.
       01 dcbAmTot         PIC 99999.
       01 bal              PIC 99999 VALUE 500.
       01 maxB             PIC 999 VALUE 200.
       01 minB             PIC 99 VALUE 10.

       01 QUITTOMENU       PIC 9. 

       SCREEN SECTION.
       01 ENTER-USERNAME.
           05 LINE 9 COLUMN 30 VALUE "Please Enter a 3 Char Username: ".
           05 LINE 9 COLUMN 65 PIC XXX USING user-name.

       01 ROLL-COUNTER.
           05 LINE 5 COLUMN 27 PIC Z9 USING rollAgainCounter.
       01 USER-BALANCE.
           05 LINE 7 COLUMN 24 PIC ZZZZ9 USING bal.

       01 USER-MENU-CHOICE-MSG.
           05 LINE 1 COLUMN 1 PIC Z USING MENUCHOICE.

       01 RETURN-MENU.
           05 LINE 21 COLUMN 20 VALUE "Press Enter to go Menu: ".
           05 LINE 21 COLUMN 44 PIC Z USING QUITTOMENU.
       
       01 INVALID-BET.
           05 LINE 9 COLUMN 30 VALUE "Invalid Bet Amount Must = 10-200".
           05 LINE 9 COLUMN 63 VALUE "        ".
       01 INVALID-BALANCE.
           05 LINE 9 COLUMN 30 VALUE "  Insufficent Funds: Press Enter".

       01 INVALID-CHOICE.
           05 LINE 9 COLUMN 30 VALUE "      Invalid Choice. Try again.".

       01 USER-CHOICE-PBMSG.
           05 LINE 9 COLUMN 30 VALUE "      Enter 1=Pass 2=Dont Pass: ".
           05 LINE 9 COLUMN 65 PIC ZZZ USING USER-CHOICE.
          
       01 USER-CHOICE-ROLLMSG.
           05 LINE 9 COLUMN 30 VALUE "           Press Enter to Roll: ".
           05 LINE 9 COLUMN 65 PIC ZZZ USING USER-ROLL-CHOICE.

       01 USER-CHOICE-CBMSG.
           05 LINE 9 COLUMN 30 VALUE " 1=Come 2=Dont Come Enter=Roll: ".
           05 LINE 9 COLUMN 65 PIC ZZZ USING USER-CHOICE.

       01 USER-BET-PASS.
           05 LINE 9 COLUMN 30 VALUE "How much would you like to bet: ".
           05 LINE 9 COLUMN 65 PIC ZZZ USING bAmou.

       01 PLACE-BET-PASS.
           05 LINE 29 COLUMN 28 VALUE "(   )".
           05 LINE 29 COLUMN 29 PIC ZZZ USING bAmou.

       01 CLEAR-BET-PASS.
           05 LINE 29 COLUMN 28 VALUE "     ".  

       01 USER-BET-DONTPASS.
           05 LINE 9 COLUMN 30 VALUE "How much would you like to bet: ".
           05 LINE 9 COLUMN 65 PIC ZZZ USING bAmou.

       01 PLACE-BET-DONTPASS.
           05 LINE 26 COLUMN 69 VALUE "(   )".
           05 LINE 26 COLUMN 70 PIC ZZZ USING bAmou.

       01 CLEAR-BET-DONTPASS.
           05 LINE 26 COLUMN 69 VALUE "     ".

       01 USER-BET-COME.
           05 LINE 9 COLUMN 30 VALUE "How much would you like to bet: ".
           05 LINE 9 COLUMN 65 PIC ZZZ USING cbAm.

       01 PLACE-BET-COME.
           05 LINE 19 COLUMN 30 VALUE "(   )".
           05 LINE 19 COLUMN 31 PIC ZZZ USING cbAmTot.
           05 LINE 19 COLUMN 72 VALUE "(   )".
           05 LINE 19 COLUMN 73 PIC ZZZ USING cbAmTot.

       01 CLEAR-BET-COME.
           05 LINE 19 COLUMN 30 VALUE "     ".
           05 LINE 19 COLUMN 72 VALUE "     ".
          
       01 USER-BET-DONTCOME.
           05 LINE 9 COLUMN 30 VALUE "How much would you like to bet: ".
           05 LINE 9 COLUMN 65 PIC ZZZ USING dcbAm.

        01 PLACE-BET-DONTCOME.
           05 LINE 15 COLUMN 27 VALUE "(   )".
           05 LINE 15 COLUMN 28 PIC ZZZ USING dcbAmTot.

       01 CLEAR-BET-DONTCOME.
           05 LINE 15 COLUMN 27 VALUE " BAR ".



       01 PUCK-ON-4.
           05 LINE 13 COLUMN 36 VALUE "(X)".

       01 CLEAR-PUCK-4.
           05 LINE 13 COLUMN 36 VALUE "   ".

        01 PUCK-ON-5.
           05 LINE 13 COLUMN 44 VALUE "(X)".

       01 CLEAR-PUCK-5.
           05 LINE 13 COLUMN 44 VALUE "   ".

       01 PUCK-ON-6.
           05 LINE 13 COLUMN 52 VALUE "(X)".

       01 CLEAR-PUCK-6.
           05 LINE 13 COLUMN 52 VALUE "   ".

       01 PUCK-ON-8.
           05 LINE 13 COLUMN 60 VALUE "(X)".

       01 CLEAR-PUCK-8.
           05 LINE 13 COLUMN 60 VALUE "   ".

       01 PUCK-ON-9.
           05 LINE 13 COLUMN 68 VALUE "(X)".

       01 CLEAR-PUCK-9.
           05 LINE 13 COLUMN 68 VALUE "   ".

       01 PUCK-ON-10.
           05 LINE 13 COLUMN 76 VALUE "(X)".

       01 CLEAR-PUCK-10.
           05 LINE 13 COLUMN 76 VALUE "   ".

       01 WIN-SCREEN.
           05 BLANK SCREEN.
           05 LINE 2 COLUMN 5 VALUE "__   _____  _   _  ".
           05 LINE 2 COLUMN 23 VALUE "__        _____ _   _ _ ".
           05 LINE 3 COLUMN 5 VALUE "\ \ / / _ \| | | | ".
           05 LINE 3 COLUMN 23 VALUE "\ \      / /_ _| \ | | |".
           05 LINE 4 COLUMN 5 VALUE " \ V / | | | | | | ".
           05 LINE 4 COLUMN 23 VALUE " \ \ /\ / / | ||  \| | |".
           05 LINE 5 COLUMN 5 VALUE "  | || |_| | |_| | ".
           05 LINE 5 COLUMN 23 VALUE "  \ V  V /  | || |\  |_|".
           05 LINE 6 COLUMN 5 VALUE "  |_| \___/ \___/  ".
           05 LINE 6 COLUMN 23 VALUE "   \_/\_/  |___|_| \_(_)".
           05 LINE 7 COLUMN 5 VALUE "                   ".
           05 LINE 7 COLUMN 23 VALUE "                         ".
           05 LINE 8 COLUMN 5 VALUE "    Would You Like ".
           05 LINE 8 COLUMN 23 VALUE "To Play Again? (Y/N): ".
           05 LINE 8 COLUMN 46 PIC X USING PLAY-AGAIN. 

       01 LOSS-SCREEN.
           05 BLANK SCREEN.
           05 LINE 2 COLUMN 5 VALUE "__   _____  _   _   _    ".
           05 LINE 2 COLUMN 30 VALUE " ___  ____  _____      __".
           05 LINE 3 COLUMN 5 VALUE "\ \ / / _ \| | | | | |   ".
           05 LINE 3 COLUMN 30 VALUE "/ _ \/ ___|| ____|  _ / /".
           05 LINE 4 COLUMN 5 VALUE " \ V / | | | | | | | |  |".
           05 LINE 4 COLUMN 30 VALUE " | | \___ \|  _|   (_) | ".
           05 LINE 5 COLUMN 5 VALUE "  | || |_| | |_| | | |__|".
           05 LINE 5 COLUMN 30 VALUE " |_| |___| | |___   _| | ".
           05 LINE 6 COLUMN 5 VALUE "  |_| \___/ \___/  |_____".
           05 LINE 6 COLUMN 30 VALUE "\___/|____/|_____| (_) | ".
           05 LINE 7 COLUMN 5 VALUE "                         ".
           05 LINE 7 COLUMN 30 VALUE "                      \_\".
           05 LINE 8 COLUMN 5 VALUE "    Would You Like To Pla".
           05 LINE 8 COLUMN 30 VALUE "y Again? (Y/N): ".
           05 LINE 8 COLUMN 46 PIC X USING PLAY-AGAIN.

       

       PROCEDURE DIVISION.
           PERFORM GAME-LOOP.    

       GAME-MENU.
           CALL "MENU".
           DISPLAY USER-MENU-CHOICE-MSG
           ACCEPT USER-MENU-CHOICE-MSG
           EVALUATE MENUCHOICE 
               WHEN 1
                   CONTINUE
               WHEN 2
                   PERFORM LEADERBOARD
               WHEN 3
                   STOP RUN
           END-EVALUATE.

       LEADERBOARD.
           CALL "LEADERBOARD".
           DISPLAY RETURN-MENU
           ACCEPT RETURN-MENU
           EVALUATE QUITTOMENU
               WHEN 0
                   PERFORM GAME-MENU
           END-EVALUATE.
                  

       START-GAME.
           CALL "BOARD".
           MOVE 'Y' TO rollAgain
           MOVE 0 TO point
           MOVE 'N' TO passLineBet
           MOVE 'N' TO DontpassLineBet
           MOVE 'N' TO Comebet
           MOVE 'N' TO Dontcomebet.

       GAME-LOOP.
           PERFORM GAME-MENU.
           PERFORM START-GAME.
           MOVE "   " TO user-name.
           DISPLAY ENTER-USERNAME.
           ACCEPT ENTER-USERNAME.
           PERFORM UNTIL rollAgainCounter > 10 OR rollAgain = 'N'
               MOVE 0 TO bAmou
               DISPLAY USER-BALANCE
               DISPLAY ROLL-COUNTER
               DISPLAY USER-CHOICE-PBMSG
               ACCEPT USER-CHOICE-PBMSG
               EVALUATE USER-CHOICE
                   WHEN 1
                       MOVE 'N' TO validBet
                       PERFORM PASS-LINE-BET
                   WHEN 2
                       MOVE 'N' TO validBet
                       PERFORM DONT-PASS-LINE-BET
                   WHEN 5
                       MOVE 'N' TO rollAgain
                   WHEN OTHER
                       MOVE 0 TO USER-CHOICE
                       DISPLAY USER-CHOICE-PBMSG
                       DISPLAY INVALID-CHOICE
                       CALL "C$SLEEP" USING 2
               END-EVALUATE
    
               IF rollAgain NOT = 'N' AND USER-CHOICE = 1 
               OR USER-CHOICE = 2
                   DISPLAY USER-CHOICE-ROLLMSG
                   ACCEPT USER-CHOICE-ROLLMSG
                   IF USER-CHOICE = 1 OR USER-CHOICE = 2 
                       IF USER-ROLL-CHOICE = 0  
                           PERFORM PLAY-CRAPS
                       END-IF
                   END-IF
               END-IF
    
               IF bal < minB
                   MOVE 'N' TO rollAgain
               END-IF
           END-PERFORM.
           

           IF rollAgainCounter > 10
               OPEN EXTEND highscore-file
               IF file-status not = "00"
                   DISPLAY "Error opening file, status: " file-status
                   STOP RUN.
               
               PERFORM UPDATE-HIGH
               CLOSE highscore-file
               PERFORM GAME-LOOP
           

           STOP RUN.
          

       PASS-LINE-BET.
           PERFORM UNTIL validBet = 'Y'
               DISPLAY USER-BET-PASS
               ACCEPT USER-BET-PASS
               IF bAmou <= maxB AND bAmou >= minB AND bAmou <= bal
                   MOVE 'Y' TO validBet
                   SUBTRACT bAmou FROM bal
                   DISPLAY PLACE-BET-PASS
                   DISPLAY USER-BALANCE
               ELSE
                   DISPLAY INVALID-BET
                   CALL "C$SLEEP" USING 2 
               END-IF
           END-PERFORM.

       DONT-PASS-LINE-BET.
           PERFORM UNTIL validBet = 'Y'
               DISPLAY USER-BET-DONTPASS
               ACCEPT USER-BET-DONTPASS
               IF bAmou <= maxB AND bAmou >= minB AND bAmou <= bal
                   MOVE 'Y' TO validBet
                   SUBTRACT bAmou FROM bal
                   DISPLAY PLACE-BET-DONTPASS
                   DISPLAY USER-BALANCE
               ELSE
                   DISPLAY INVALID-BET
                   CALL "C$SLEEP" USING 2 
               END-IF
           END-PERFORM.

       COME-BET.
           MOVE 'Y' TO Comebet
           DISPLAY USER-BALANCE
           PERFORM UNTIL validBet = 'Y'
               DISPLAY USER-BET-COME
               ACCEPT USER-BET-COME
               IF cbAm <= maxB AND cbAm >= minB AND cbAm <= bal THEN
                 MOVE 'Y' TO validBet
                 SUBTRACT cbAm FROM bal
                 ADD cbAm to cbAmTot
                 DISPLAY PLACE-BET-COME
                 DISPLAY USER-BALANCE
               ELSE
                 DISPLAY INVALID-BET
                 CALL "C$SLEEP" USING 2
           END-PERFORM.

       DONT-COME-BET.
           MOVE 'Y' TO Dontcomebet
           DISPLAY USER-BALANCE
           PERFORM UNTIL validBet = 'Y'
               DISPLAY USER-BET-DONTCOME
               ACCEPT USER-BET-DONTCOME
               IF dcbAm <= maxB AND dcbAm >= minB AND dcbAm <= bal THEN
                 MOVE 'Y' TO validBet
                 SUBTRACT dcbAm FROM bal
                 ADD dcbAm TO dcbAmTot
                 DISPLAY PLACE-BET-DONTCOME
                 DISPLAY USER-BALANCE
               ELSE
                 DISPLAY INVALID-BET
                 CALL "C$SLEEP" USING 2 
           END-PERFORM.


       PLAY-CRAPS.
           PERFORM DO-ROLL.
           EVALUATE diceTotal
               WHEN 7
                   IF USER-CHOICE = 1
                       PERFORM HANDLE-WIN
                   ELSE 
                       PERFORM HANDLE-LOSS
               WHEN 11
                   IF USER-CHOICE = 1
                       PERFORM HANDLE-WIN
                   ELSE 
                       PERFORM HANDLE-LOSS
               WHEN 2
                   IF USER-CHOICE = 2
                       PERFORM HANDLE-WIN
                   ELSE 
                       PERFORM HANDLE-LOSS
               WHEN 3
                   IF USER-CHOICE = 2
                       PERFORM HANDLE-WIN
                   ELSE 
                       PERFORM HANDLE-LOSS
               WHEN 12
                   IF USER-CHOICE = 2
                       PERFORM HANDLE-WIN
                   ELSE 
                       PERFORM HANDLE-LOSS
               WHEN OTHER
                   PERFORM POINT-ROLL
           END-EVALUATE.
        
       DO-ROLL.
           CALL "ROLL" USING BY REFERENCE DIE1 DIE2.
           COMPUTE diceTotal = DIE1 + DIE2.
       
       POINT-DISP.
           IF point = 4
               DISPLAY PUCK-ON-4
           ELSE
               DISPLAY CLEAR-PUCK-4
           END-IF
          
           IF point = 5
               DISPLAY PUCK-ON-5
           ELSE
               DISPLAY CLEAR-PUCK-5
           END-IF
          
           IF point = 6
               DISPLAY PUCK-ON-6
           ELSE
               DISPLAY CLEAR-PUCK-6
           END-IF
          
           IF point = 8
               DISPLAY PUCK-ON-8
           ELSE
               DISPLAY CLEAR-PUCK-8
           END-IF
          
           IF point = 9
               DISPLAY PUCK-ON-9
           ELSE
               DISPLAY CLEAR-PUCK-9
           END-IF
          
           IF point = 10
               DISPLAY PUCK-ON-10
           ELSE
               DISPLAY CLEAR-PUCK-10
           END-IF.

       HANDLE-WIN.
           MOVE 0 TO USER-CHOICE
           MOVE 0 TO USER-ROLL-CHOICE
           COMPUTE bAmou = bAmou * doub
           COMPUTE bal = bal + bAmou
           DISPLAY CLEAR-BET-PASS
           DISPLAY CLEAR-BET-DONTPASS
           DISPLAY CLEAR-BET-COME.
           DISPLAY CLEAR-BET-DONTCOME.
           MOVE 0 TO point
           PERFORM POINT-DISP
           IF Comebet = 'Y'
               COMPUTE cbAmTot = cbAmTot * doub
               COMPUTE bal = bal + cbAmTot
           END-IF
           IF Dontcomebet = 'Y'
               COMPUTE dcbAmTot = dcbAmTot * doub
               COMPUTE bal = bal + dcbAmTot
           END-IF.
           COMPUTE rollAgainCounter = rollAgainCounter + 1
           DISPLAY WIN-SCREEN
           ACCEPT WIN-SCREEN.
           EVALUATE PLAY-AGAIN
               WHEN 'Y'
                   PERFORM START-GAME
               WHEN 'N'
                   STOP RUN
               WHEN OTHER
                   DISPLAY INVALID-CHOICE
                   CALL "C$SLEEP" USING 2
           END-EVALUATE.
       HANDLE-LOSS.
           MOVE 0 TO USER-CHOICE
           MOVE 0 TO USER-ROLL-CHOICE
           MOVE 0 TO cbAm
           MOVE 0 TO point
           DISPLAY CLEAR-BET-PASS
           DISPLAY CLEAR-BET-DONTPASS
           DISPLAY CLEAR-BET-COME.
           DISPLAY CLEAR-BET-DONTCOME.
           PERFORM POINT-DISP
           COMPUTE rollAgainCounter = rollAgainCounter + 1
           DISPLAY LOSS-SCREEN
           ACCEPT LOSS-SCREEN.
           EVALUATE PLAY-AGAIN
               WHEN 'Y'
                   PERFORM START-GAME
               WHEN 'N'
                   STOP RUN
               WHEN OTHER
                   DISPLAY INVALID-CHOICE
                   CALL "C$SLEEP" USING 2
           END-EVALUATE.

       POINT-ROLL.
           MOVE diceTotal TO point
           MOVE 'N' TO pointCheck
           PERFORM UNTIL pointCheck = 'Y'
               MOVE 0 TO USER-CHOICE
               MOVE 0 TO bAmou
               PERFORM POINT-DISP
               DISPLAY USER-CHOICE-CBMSG
               ACCEPT USER-CHOICE-CBMSG
          
               EVALUATE USER-CHOICE
                   WHEN 0
                       PERFORM DO-ROLL
                       IF diceTotal = point
                           IF Comebet = 'Y'
                               PERFORM HANDLE-WIN
                               MOVE 'Y' TO pointCheck
                               MOVE 'N' TO Comebet
                           ELSE 
                               PERFORM HANDLE-LOSS
                               MOVE 'Y' TO pointCheck
                       ELSE IF diceTotal = 7
                           IF Dontcomebet = 'Y'
                               PERFORM HANDLE-WIN
                               MOVE 'Y' TO pointCheck
                               MOVE 'N' TO Dontcomebet
                           ELSE 
                               PERFORM HANDLE-LOSS
                               MOVE 'Y' TO pointCheck
                       END-IF
          
                   WHEN 1
                       IF bal > minB
                         MOVE 'N' to validBet
                         PERFORM COME-BET
                       ELSE 
                         DISPLAY INVALID-BALANCE
                         CALL "C$SLEEP" USING 2
                       END-IF
                   WHEN 2
                       IF bal > minB
                         MOVE 'N' to validBet
                         PERFORM DONT-COME-BET
                       ELSE 
                         DISPLAY INVALID-BALANCE
                         CALL "C$SLEEP" USING 2 
                       END-IF
                   WHEN 'Q'
                       MOVE 'N' TO rollAgain
                       MOVE 'Y' TO pointCheck
                   WHEN OTHER
                       DISPLAY INVALID-CHOICE
                       CALL "C$SLEEP" USING 2
               END-EVALUATE
           END-PERFORM.           
           
       UPDATE-HIGH.
           MOVE bal            TO  high-score
           MOVE user-name      TO  high-name
           WRITE highscore-file-out.
