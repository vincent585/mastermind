# Mastermind
The classic code-breaking game designed by Mordecai Meirowitz, done in Ruby!

UI:
  - This game will be played entirely in the command line. It will utilize
    the 'colorize' gem to properly display the code at the end of the game,
    as well as color coding the instructions for the available colors.

  - It will also utilize squares to represent the "peg" positions, and color feedback
    to indicate where there is a correct color guess, correct position guess, or both.

Inputs:
  - Takes a starter code for the player to break. This can be input by one user for a two
    player game, or generated by the game for one player games.
  
  - Takes a role selection input, i.e. code breaker or code maker.

  - Takes a maximum number of guesses input to determine max game length.

  - Continually takes guess inputs from the code breaker until the guess matches to code or
    they have reached the maximum number of guesses.

Outputs:
  - After a guess is made, it should return a sequence of squares with color feedback on the user's
    guess.

  - When the game ends, output the original color code and a game-won or game-lost message.

Necessary steps:
  1) Display the intructions and rules of the game.
  2) Ask user for desired game mode
    - Code-maker or Code-breaker?
  3) If the player chooses code-maker, ask the player to generate the 4 "peg" code.
    - Else, generate a random 4 "peg" code.
    - 6 possible color choices: red, blue, green, yellow, cyan, magenta. The colors can be unique or duplicates.
  4) Ask user for maximum number of guesses.
    - 8, 10, or 12.
  5) Start the game loop by checking whether the human is the code-breaker or maker, and if max guesses has been reached.
    - If the player is the the code-breaker, prompt for a guess.
    - After the guess, check if the guess is correct. If yes, declare winner and end game.
      If not correct, provide feedback on the user's guess. 
    - Prompt for another guess until max guesses reached or a correct guess.
  5b) If AI is the code-breaker, start game loop for the computer and check if max guesses reached.
    - After each guess is made, check for correctness and provide feedback.
    - Sleep for a brief moment between guesses so the game doesn't instantly end
    - Continue until max guesses reached or a correct guess.
