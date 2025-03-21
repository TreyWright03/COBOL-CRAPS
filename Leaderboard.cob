       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEADERBOARD.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT highscore-file ASSIGN TO "highscore.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS file-status.

       DATA DIVISION.
       FILE SECTION.
       FD highscore-file.
       01 highscore-file-in.
           02 high-name  PIC XXX.
           02 high-score PIC 9(5).

       WORKING-STORAGE SECTION.

       01 file-status      PIC 99.
       01 total-entries    PIC 99 VALUE 0.
       01 temp-score       PIC 9(5).
       01 temp-name        PIC XXX.
       01 i                PIC 99.
       01 j                PIC 99.
       01 end-of-file      PIC X  VALUE 'N'.

       01 highscore-table.
           05 high-entry OCCURS 100 TIMES INDEXED BY high-index.
               10 high-tbl-name  PIC XXX.
               10 high-tbl-score PIC 9(5).

       01 name1            PIC XXX.
       01 name2            PIC XXX.
       01 name3            PIC XXX.
       01 name4            PIC XXX.
       01 name5            PIC XXX.
       01 name6            PIC XXX.
       01 name7            PIC XXX.
       01 name8            PIC XXX.
       01 name9            PIC XXX.
       01 name10           PIC XXX.
       
       01 score1           PIC 9(5).
       01 score2           PIC 9(5).
       01 score3           PIC 9(5).
       01 score4           PIC 9(5).
       01 score5           PIC 9(5).
       01 score6           PIC 9(5).
       01 score7           PIC 9(5).
       01 score8           PIC 9(5).
       01 score9           PIC 9(5).
       01 score10          PIC 9(5).


       SCREEN SECTION.
       01 LEADER-BOARD.
           05 BLANK SCREEN.
           05 LINE 3 COLUMN 20 VALUE " _______________________ ".
           05 LINE 4 COLUMN 20 VALUE "|      LEADERBOARD      |".
           05 LINE 5 COLUMN 20 VALUE "|     TOP 10 SCORES     |".
           05 LINE 6 COLUMN 20 VALUE "|_______________________|".
           05 LINE 7 COLUMN 20 VALUE "| # | NAMES |   SCORE   |".
           05 LINE 8 COLUMN 20 VALUE "|___|_______|___________|".
           05 LINE 9 COLUMN 20 VALUE "| 1 |       |           |".
           05 LINE 10 COLUMN 20 VALUE "| 2 |       |           |".
           05 LINE 11 COLUMN 20 VALUE "| 3 |       |           |".
           05 LINE 12 COLUMN 20 VALUE "| 4 |       |           |".
           05 LINE 13 COLUMN 20 VALUE "| 5 |       |           |".
           05 LINE 14 COLUMN 20 VALUE "| 6 |       |           |".
           05 LINE 15 COLUMN 20 VALUE "| 7 |       |           |".
           05 LINE 16 COLUMN 20 VALUE "| 8 |       |           |".
           05 LINE 17 COLUMN 20 VALUE "| 9 |       |           |".
           05 LINE 18 COLUMN 20 VALUE "| 10|       |           |".
           05 LINE 19 COLUMN 20 VALUE "|___|_______|___________|".

       01 HIGH-PLAYER1.
           05 LINE 9 COLUMN 27 PIC XXX USING name1.
           05 LINE 9 COLUMN 36 PIC 9(5) USING score1.
           05 LINE 10 COLUMN 27 PIC XXX USING name2.
           05 LINE 10 COLUMN 36 PIC 9(5) USING score2.
           05 LINE 11 COLUMN 27 PIC XXX USING name3.
           05 LINE 11 COLUMN 36 PIC 9(5) USING score3.
           05 LINE 12 COLUMN 27 PIC XXX USING name4.
           05 LINE 12 COLUMN 36 PIC 9(5) USING score4.
           05 LINE 13 COLUMN 27 PIC XXX USING name5.
           05 LINE 13 COLUMN 36 PIC 9(5) USING score5.
           05 LINE 14 COLUMN 27 PIC XXX USING name6.
           05 LINE 14 COLUMN 36 PIC 9(5) USING score6.
           05 LINE 15 COLUMN 27 PIC XXX USING name7.
           05 LINE 15 COLUMN 36 PIC 9(5) USING score7.
           05 LINE 16 COLUMN 27 PIC XXX USING name8.
           05 LINE 16 COLUMN 36 PIC 9(5) USING score8.
           05 LINE 17 COLUMN 27 PIC XXX USING name9.
           05 LINE 17 COLUMN 36 PIC 9(5) USING score9.
           05 LINE 18 COLUMN 27 PIC XXX USING name10.
           05 LINE 18 COLUMN 36 PIC 9(5) USING score10.
           
           

       PROCEDURE DIVISION.
           OPEN INPUT highscore-file.
           IF file-status NOT = 0
               DISPLAY "Error opening file, status: " file-status
               STOP RUN.
           
           PERFORM READ-HIGHSCORES UNTIL end-of-file = 'Y'.
           CLOSE highscore-file.

           IF total-entries > 1
               PERFORM SORT-SCORES.

           PERFORM STORE-TOP10.
           PERFORM DISPLAY-TOP10.

       READ-HIGHSCORES.
           PERFORM UNTIL end-of-file = 'Y'
               READ highscore-file AT END
                   MOVE 'Y' TO end-of-file
               NOT AT END
                   ADD 1 TO total-entries
                   MOVE high-name  TO high-tbl-name(total-entries)
                   MOVE high-score TO high-tbl-score(total-entries)
               END-READ
           END-PERFORM.

       SORT-SCORES.
           PERFORM VARYING i FROM 1 BY 1 UNTIL i >= total-entries
               PERFORM VARYING j FROM i BY 1 UNTIL j > total-entries
                   IF high-tbl-score(i) < high-tbl-score(j)
                       MOVE high-tbl-score(i) TO temp-score
                       MOVE high-tbl-name(i)  TO temp-name

                       MOVE high-tbl-score(j) TO high-tbl-score(i)
                       MOVE high-tbl-name(j)  TO high-tbl-name(i)

                       MOVE temp-score TO high-tbl-score(j)
                       MOVE temp-name  TO high-tbl-name(j)
                   END-IF
               END-PERFORM
           END-PERFORM.

       STORE-TOP10.
           PERFORM VARYING i FROM 1 BY 1 UNTIL i > 10 
           OR i > total-entries
               EVALUATE i
                   WHEN 1
                       MOVE high-tbl-name(i) TO name1
                       MOVE high-tbl-score(i) TO score1
                   WHEN 2
                       MOVE high-tbl-name(i) TO name2
                       MOVE high-tbl-score(i) TO score2
                   WHEN 3
                       MOVE high-tbl-name(i) TO name3
                       MOVE high-tbl-score(i) TO score3
                   WHEN 4
                       MOVE high-tbl-name(i) TO name4
                       MOVE high-tbl-score(i) TO score4
                   WHEN 5
                       MOVE high-tbl-name(i) TO name5
                       MOVE high-tbl-score(i) TO score5
                   WHEN 6
                       MOVE high-tbl-name(i) TO name6
                       MOVE high-tbl-score(i) TO score6
                   WHEN 7
                       MOVE high-tbl-name(i) TO name7
                       MOVE high-tbl-score(i) TO score7
                   WHEN 8
                       MOVE high-tbl-name(i) TO name8
                       MOVE high-tbl-score(i) TO score8
                   WHEN 9
                       MOVE high-tbl-name(i) TO name9
                       MOVE high-tbl-score(i) TO score9
                   WHEN 10
                       MOVE high-tbl-name(i) TO name10
                       MOVE high-tbl-score(i) TO score10
               END-EVALUATE
           END-PERFORM.

       DISPLAY-TOP10.
           DISPLAY LEADER-BOARD.
           DISPLAY HIGH-PLAYER1.
