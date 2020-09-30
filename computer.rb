class Computer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def computer_guess
    puts "#{name} is attempting to crack your secret code..."
    sleep(1)
    guess = []
    4.times { guess.push(Board::COLOR_PEGS.sample) }
    guess
  end

  def improve_guess(guess, feedback)
    puts "#{name} is trying again..."
    sleep(1)
    new_guess = guess
    guess.each_with_index do |_, index|
      next if feedback[index] == 'BLACK'

      new_guess[index] = Board::COLOR_PEGS.sample
    end
    puts "Alfredo's guess is: #{new_guess.join(', ')}"
    new_guess
  end
end
