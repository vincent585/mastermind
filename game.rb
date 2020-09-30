require_relative 'board'
require_relative 'player'
require_relative 'computer'

class Game
  attr_reader :game_type

  def initialize
    display_instructions
    @game_type = choose_game_mode
    @player = Player.new
    @computer = Computer.new('Alfredo')
    @board = Board.new(game_type)
  end

  def play_game
    game_type == 1 ? play_codebreaker : play_codemaker
  end

  private

  attr_reader :player, :board, :computer

  def display_instructions
    puts <<-HEREDOC
                  Welcome to Mastermind: The code-breaking game!

    The first step is to decide whether you want to make the code, or break it!
    If you want to be the code maker, you'll have to create a 4 color combination for
    the computer to guess. Otherwise, the computer will generate a code for you to crack.
      
    The possible colors for a code are: r(ed), g(reen), b(lue), c(yan), m(agenta) and y(ellow).
    You may choose any combination of colors you choose, including the same color two or more times.
      
    The code breaker will have a chosen number of guesses to try and crack the code. If the 
    code breaker does not crack the code before the maximum number of guesses is reached, 
    the code maker will win the game!

                  Let's get started!

    HEREDOC
  end

  def choose_game_mode
    puts 'Would you like to be the Codebreaker, or the Codemaker?'
    puts "Enter '1' for Codebreaker, or '2' for Codemaker."
    game_mode = gets.chomp.to_i
    until valid_mode?(game_mode)
      puts 'Please enter a valid game mode!'
      game_mode = gets.chomp.to_i
    end
    game_mode
  end

  def check_game_mode(game_mode)
    game_mode == 1 ? play_codebreaker : play_codemaker
  end

  def play_codebreaker
    current_turn = 0
    loop do
      return game_lost if current_turn == 12

      puts "Guess a sequence of 4 colors like so: 'rgby'"
      current_turn += 1
      return game_won if board.player_correct_guess?(player.guess)
    end
  end

  def play_codemaker
    current_turn = 0
    guess = computer.computer_guess
    loop do
      return computer_lost_game if current_turn == 12

      current_turn += 1
      return computer_won_game if board.correct_guess?(guess)

      guess = computer.improve_guess(guess, board.computer_feedback(guess))
    end
  end

  def valid_mode?(game_mode)
    [1, 2].include?(game_mode) ? true : false
  end

  def game_lost
    puts "You didn't crack the code in time! Game over!"
    puts "The secret code was #{board.show_color_code}"
  end

  def game_won
    puts 'You cracked the code! Nice work, Hacker!'
  end

  def computer_won_game
    puts 'The computer cracked your code! Better luck next time.'
  end

  def computer_lost_game
    puts 'You outsmarted a computer! Score one for humanity!'
  end
end

g = Game.new
g.play_game
