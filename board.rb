class Board

  # r = red | g = green | b = blue | y = yellow | c = cyan | m = magenta |
  COLOR_PEGS = ["r", "g", "b", "y", "c", "m"]

  def initialize
    @color_code = computer_create_board
  end

  private

  def computer_create_board
    code = []
    4.times { code.push(COLOR_PEGS.sample) }
    code
  end

end