# Manages human choice of colors
# Keeps track of current guess, and number of guesses

class HumanPlayer
  attr_accessor :guess, :current_guess_no

  def initialize
    @current_guess_no = 0
    @guess = []
  end
  
  def make_guess
    puts "Guess no: #{@current_guess_no + 1} "
    puts "Please enter your 4 guesses separated by spaces (e.g. red green blue yellow): "
    input = gets.chomp.downcase
    @guess = input.split.map(&:to_sym)
    increment_guess_no
  end
 
  def increment_guess_no
    @current_guess_no += 1
  end
 
  def store_current_guess_no(_guess)
    @current_guess_no = current_guess_no
  end
end
