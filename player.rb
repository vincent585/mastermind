require_relative 'board'

class Player
  def initialize
    puts "What's your name?"
    @name = gets.chomp
  end

  def guess
    player_guess = gets.chomp.downcase.split('')
    until valid_guess?(player_guess)
      puts 'Please enter a valid sequence!'
      player_guess = gets.chomp.downcase.split('')
    end
    player_guess
  end

  private

  def valid_guess?(player_guess)
    return false if player_guess.length != 4

    player_guess.each do |char|
      return false unless Board::COLOR_PEGS.include?(char)
    end
    true
  end
end
