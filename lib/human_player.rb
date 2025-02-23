# Manages human choice of colors
# Manages number of guesses
require_relative 'displayable'

class HumanPlayer
  include Displayable
  
  def initialize
    @current_guess_no = 0
  end

  def make_guess
    valid_colors_UI #Displayable
    puts "Please enter guess no #{@current_guess_no + 1}: "
    guess = gets.chomp.downcase
    @current_guess_no += 1
    return guess
  end
end

human_player = HumanPlayer.new

puts "Player guessed: #{human_player.make_guess}"