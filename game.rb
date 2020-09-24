require_relative 'board'
require_relative 'player'

class Game
  def initialize
    display_instructions
    @board = Board.new
    @player = Player.new
  end

  def play_game
    current_turn = 0
    loop do
      return game_lost if current_turn == 12

      puts "Guess a sequence of 4 colors like so: 'rgby'"
      current_turn += 1
      return game_won if board.correct_guess?(player.guess)
      # TODO
    end
  end

  private

  attr_reader :player, :board

  def display_instructions
    puts <<-HEREDOC
                  Welcome to Mastermind: The code-breaking game!

    The first step is to decide whether you want to make the code, or break it!
    If you want to be the code maker, you'll have to create a 4 color combination for
    the computer to guess. Otherwise, the computer will generate a code for you to crack.
      
    The possible colors for a code are: Red, Green, Blue, Cyan, Magenta and Yellow.
    You may choose any combination of colors you choose, including the same color two or more times.
      
    The code breaker will have a chosen number of guesses to try and crack the code. If the 
    code breaker does not crack the code before the maximum number of guesses is reached, 
    the code maker will win the game!

                  Let's get started!

    HEREDOC
  end

  def game_lost
    puts "You didn't crack the code in time! Game over!"
  end

  def game_won
    puts 'You cracked the code! Nice work, Hacker!'
  end
end

test = Game.new
test.play_game
