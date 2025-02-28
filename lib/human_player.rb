# frozen_string_literal: true

# Manages human choice of colors
# Keeps track of current guess, and number of guesses

class HumanPlayer < Player
  def make_guess
    loop do
      display_guess_prompt
      process_guess
      validate_input
      increment_guess_no
      break
    rescue StandardError => e
      puts e.message
      retry
    end
  end

  def set_code
    #  loop do
    set_code_prompt
    # validate_input
    # rescue StandardError => e
    # puts e.message
    #   retry
    #  end
  end

  def display_guess_prompt
    puts "Guess no: #{@current_guess_no + 1} "
    puts 'Please enter your 4 guesses separated by spaces (e.g. red green blue yellow): '
  end

  def process_guess
    input = gets.chomp.downcase
    @guess = input.split.map(&:to_sym)
  end

  def set_code_prompt
    puts 'Please enter your 4 color code separated by spaces (e.g. red green blue yellow): '
    input = gets.chomp.downcase
    @code = input.split.map(&:to_sym)
  end

  def validate_input
    raise StandardError, 'Please enter 4 valid colors.' if @guess.size != 4

    invalid_colors = @guess - GameSettings::VALID_COLORS
    raise StandardError, 'Please enter 4 valid colors with spaces.' unless invalid_colors.empty?
  end
end
