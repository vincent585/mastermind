class Computer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def computer_guess
    guess = []
    4.times { guess.push(Board::COLOR_PEGS.sample) }
    guess
  end
end
