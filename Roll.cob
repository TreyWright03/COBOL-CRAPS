       IDENTIFICATION DIVISION.
       PROGRAM-ID. ROLL.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 UNIX-TIME     PIC 9(10).
       01 RANDOM-NUMBER1 PIC 9(9).
       01 RANDOM-NUMBER2 PIC 9(9).
       01 RANDOM-INITIALIZED PIC X VALUE "N".

       01 diceTotal        PIC 99.

       01 DIE1-L1        PIC X(9).
       01 DIE1-L2        PIC X(9).
       01 DIE1-L3        PIC X(9).
       01 DIE1-L4        PIC X(9).
       01 DIE1-L5        PIC X(9).

       01 DIE2-L1        PIC X(9).
       01 DIE2-L2        PIC X(9).
       01 DIE2-L3        PIC X(9).
       01 DIE2-L4        PIC X(9).
       01 DIE2-L5        PIC X(9).
       
       LINKAGE SECTION.
       01 DIE-ROLL1      PIC 9.
       01 DIE-ROLL2      PIC 9.

       SCREEN SECTION.

       01 DICE-BOARD.
           05 LINE 3 COLUMN 43 PIC X(9) USING DIE1-L1.
           05 LINE 4 COLUMN 43 PIC X(9) USING DIE1-L2.
           05 LINE 5 COLUMN 43 PIC X(9) USING DIE1-L3.
           05 LINE 6 COLUMN 43 PIC X(9) USING DIE1-L4.
           05 LINE 7 COLUMN 43 PIC X(9) USING DIE1-L5.

           05 LINE 3 COLUMN 53 PIC X(9) USING DIE2-L1.
           05 LINE 4 COLUMN 53 PIC X(9) USING DIE2-L2.
           05 LINE 5 COLUMN 53 PIC X(9) USING DIE2-L3.
           05 LINE 6 COLUMN 53 PIC X(9) USING DIE2-L4.
           05 LINE 7 COLUMN 53 PIC X(9) USING DIE2-L5.
       
       PROCEDURE DIVISION USING DIE-ROLL1 DIE-ROLL2.
       
                  IF RANDOM-INITIALIZED = "N" 
                      MOVE "Y" TO RANDOM-INITIALIZED
                      CALL "time" USING BY REFERENCE UNIX-TIME
                      CALL "srand" USING UNIX-TIME.
       CALL "rand" RETURNING RANDOM-NUMBER1.
       CALL "rand" RETURNING RANDOM-NUMBER2.

       
       COMPUTE DIE-ROLL1 = FUNCTION MOD(RANDOM-NUMBER1, 6) + 1.
       COMPUTE DIE-ROLL2 = FUNCTION MOD(RANDOM-NUMBER2, 6) + 1.

       PERFORM ROLL-DICE.   
       DISPLAY DICE-BOARD.
       
       ROLL-DICE.
           EVALUATE DIE-ROLL1
               WHEN 1
                   MOVE "+-------+" TO DIE1-L1
                   MOVE "|       |" TO DIE1-L2
                   MOVE "|   *   |" TO DIE1-L3
                   MOVE "|       |" TO DIE1-L4
                   MOVE "+-------+" TO DIE1-L5
               WHEN 2
                   MOVE "+-------+" TO DIE1-L1
                   MOVE "|     * |" TO DIE1-L2
                   MOVE "|       |" TO DIE1-L3
                   MOVE "| *     |" TO DIE1-L4
                   MOVE "+-------+" TO DIE1-L5
               WHEN 3
                   MOVE "+-------+" TO DIE1-L1
                   MOVE "|     * |" TO DIE1-L2
                   MOVE "|   *   |" TO DIE1-L3
                   MOVE "| *     |" TO DIE1-L4
                   MOVE "+-------+" TO DIE1-L5
               WHEN 4
                   MOVE "+-------+" TO DIE1-L1
                   MOVE "| *   * |" TO DIE1-L2
                   MOVE "|       |" TO DIE1-L3
                   MOVE "| *   * |" TO DIE1-L4
                   MOVE "+-------+" TO DIE1-L5
               WHEN 5
                   MOVE "+-------+" TO DIE1-L1
                   MOVE "| *   * |" TO DIE1-L2
                   MOVE "|   *   |" TO DIE1-L3
                   MOVE "| *   * |" TO DIE1-L4
                   MOVE "+-------+" TO DIE1-L5
               WHEN 6
                   MOVE "+-------+" TO DIE1-L1
                   MOVE "| *   * |" TO DIE1-L2
                   MOVE "| *   * |" TO DIE1-L3
                   MOVE "| *   * |" TO DIE1-L4
                   MOVE "+-------+" TO DIE1-L5
               WHEN OTHER
                   DISPLAY "Invalid roll"
           END-EVALUATE.
       
           EVALUATE DIE-ROLL2
               WHEN 1
                   MOVE "+-------+" TO DIE2-L1
                   MOVE "|       |" TO DIE2-L2
                   MOVE "|   *   |" TO DIE2-L3
                   MOVE "|       |" TO DIE2-L4
                   MOVE "+-------+" TO DIE2-L5
               WHEN 2
                   MOVE "+-------+" TO DIE2-L1
                   MOVE "|     * |" TO DIE2-L2
                   MOVE "|       |" TO DIE2-L3
                   MOVE "| *     |" TO DIE2-L4
                   MOVE "+-------+" TO DIE2-L5
               WHEN 3
                   MOVE "+-------+" TO DIE2-L1
                   MOVE "|     * |" TO DIE2-L2
                   MOVE "|   *   |" TO DIE2-L3
                   MOVE "| *     |" TO DIE2-L4
                   MOVE "+-------+" TO DIE2-L5
               WHEN 4
                   MOVE "+-------+" TO DIE2-L1
                   MOVE "| *   * |" TO DIE2-L2
                   MOVE "|       |" TO DIE2-L3
                   MOVE "| *   * |" TO DIE2-L4
                   MOVE "+-------+" TO DIE2-L5
               WHEN 5
                   MOVE "+-------+" TO DIE2-L1
                   MOVE "| *   * |" TO DIE2-L2
                   MOVE "|   *   |" TO DIE2-L3
                   MOVE "| *   * |" TO DIE2-L4
                   MOVE "+-------+" TO DIE2-L5
               WHEN 6
                   MOVE "+-------+" TO DIE2-L1
                   MOVE "| *   * |" TO DIE2-L2
                   MOVE "| *   * |" TO DIE2-L3
                   MOVE "| *   * |" TO DIE2-L4
                   MOVE "+-------+" TO DIE2-L5
               WHEN OTHER
                   DISPLAY "Invalid value for the first random number"
           END-EVALUATE.
