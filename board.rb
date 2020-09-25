class Board
  # r = red | g = green | b = blue | y = yellow | c = cyan | m = magenta |
  COLOR_PEGS = %w[r g b y c m].freeze

  def initialize
    @color_code = player_create_board
  end

  def correct_guess?(player_guess)
    return true if player_guess == color_code

    display_feedback(guess_feedback(player_guess))
    false
  end

  private

  attr_reader :color_code

  def black_pegs(guess, code)
    guess.map.with_index { |color, i| 'BLACK' if color == code[i] }
  end

  def white_pegs(guess, code)
    guess.map do |color|
      i = code.index(color)
      unless i.nil?
        code[i] = 'X'
        'WHITE'
      end
    end
  end

  def guess_feedback(player_guess, code = color_code.dup)
    black = black_pegs(player_guess, code).select { |peg| peg unless peg.nil? }.length
    white = white_pegs(player_guess, code).select { |peg| peg unless peg.nil? }.length
    [black, white - black]
  end

  def display_feedback(feedback)
    puts "Black: #{feedback[0]}     White: #{feedback[1]}"
  end

  def player_create_board
    display_board_rules
    colors = gets.chomp.downcase.split('')
    until valid_code?(colors)
      puts 'Please enter a valid code!'
      colors = gets.chomp.downcase.split('')
    end
    colors
  end

  def valid_code?(colors)
    return false unless colors.length == 4

    colors.all? { |color| COLOR_PEGS.include?(color) }
  end

  def display_board_rules
    puts 'Choose a secret code! Acceptable inputs are r, g, b, y, m, c.'
    puts 'You may also include duplicates in your code.'
  end

  def computer_create_board
    code = []
    4.times { code.push(COLOR_PEGS.sample) }
    code
  end
end

foo = Board.new
