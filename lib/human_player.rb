# frozen_string_literal: true

# Manages human choice of colors
# Keeps track of current guess, and number of guesses

class HumanPlayer
  attr_accessor :guess, :current_guess_no

  def initialize
    @current_guess_no = 0
    @guess = []
  end

  def make_guess
    loop do
      display_guess_prompt
      process_guess
      validate_guess
      increment_guess_no
      break
    rescue StandardError => e
      puts e.message
      retry
    end
  end

  def display_guess_prompt
    puts "Guess no: #{@current_guess_no + 1} "
    puts 'Please enter your 4 guesses separated by spaces (e.g. red green blue yellow): '
  end

  def process_guess
    input = gets.chomp.downcase
    @guess = input.split.map(&:to_sym)
  end

  def validate_guess
    raise StandardError, 'Please enter 4 valid colors.' if @guess.size != 4

    invalid_colors = @guess - GameSettings::VALID_COLORS
    raise StandardError, 'Please enter 4 valid colors with spaces.' unless invalid_colors.empty?
  end

  def increment_guess_no
    @current_guess_no += 1
  end

  def store_current_guess_no(_guess)
    @current_guess_no = current_guess_no
  end
end
