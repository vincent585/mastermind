require_relative 'player'

class Board

  # r = red | g = green | b = blue | y = yellow | c = cyan | m = magenta |
  COLOR_PEGS = ["r", "g", "b", "y", "c", "m"]

  def initialize
    @color_code = computer_create_board
  end

  def correct_guess?(player_guess)
    return true if player_guess == color_code.join
    provide_guess_feedback
    false
  end

  private

  attr_reader :color_code

  def computer_create_board
    code = []
    4.times { code.push(COLOR_PEGS.sample) }
    code
  end

end