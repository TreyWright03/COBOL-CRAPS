
# COBOL CRAPS

This is a version of Casino Craps written in COBOL!




## Running The Program
Before running the program make sure you have GNUCOBOL installed on your computer

To run the program downlaod all the files above and in the terminal enter the below command to compile the program.

```bash
  cobc -x Craps.cob Leaderboard.cob Menu.cob Roll.cob Board.cob
```
Now that the program is sucsesfully compiled you can enter the following command to run the program.

```bash
  ./Craps
``` 

## Playing The Game

1. You start off on the menu screen where can select 3 options Start, Leaderboard, or Quit.
2. Clicking Start will bring you to the Craps table where you can enter your 3 character username and if you chose to play 10 games it will be saved onto the Leaderbaord (ONLY TOP 10 SCORES ARE ON LEADERBOARD) which you can view on launch!
3. After settign a User Name you can chose to bet Pass or Dont Pass, and then you can place your bet, and roll the dice.
4. If you where lucky enough to not lose on the first roll you will be prompted to place a bet on the Come, Dont Come, or you can simply just press enter to roll again.
5. Once you roll enough you either win or you lose, or if you chose to play the 10 games you can selcet play again on the WIN/LOSS screen and it will take you to the Menu Screen.
6. From here on its a repeating cycle you can choose to play a new game or look at your new score on the leaderboard! (you will have to quit and relaunch if you want to view as soon as you get done playing).

## Thanks For Playing!



## License

[MIT](https://choosealicense.com/licenses/mit/)

