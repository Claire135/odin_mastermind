# frozen_string_literal: true

# Generates master code for player to break
# Stores code and computer guess depending on mode
# Generates guesses in Computer code breaker mode

class ComputerPlayer < Player
  attr_accessor :locked_pegs, :available_colors, :guess

  include Rules

  def initialize
    super()
    @available_colors = %i[red green orange blue purple yellow]
    @guess = generate_guess
    @locked_pegs = [nil, nil, nil, nil]
  end

  def generate_guess
    Array.new(4) { @available_colors.sample }
  end

  def get_feedback(code, guess)
    guess.map.with_index { |color, i| color == code[i] ? :darkred : :white }
  end

  def assign_locked_pegs(code)
    get_feedback(code, @guess).each_with_index do |feedback, i|
      @locked_pegs[i] = @guess[i] if feedback == :darkred
    end
  end

  def remove_color_from_available_colors(code)
    @guess.each_with_index do |color, i|
      @available_colors.delete(color) if color == code[i]
    end
  end

  def white_pegs_guess_again
    @guess = @guess.map.with_index do |_color, i|
      @locked_pegs[i] || @available_colors.sample
    end
  end

  def make_guess(code)
    assign_locked_pegs(code)
    remove_color_from_available_colors(code)
    white_pegs_guess_again
  end

  def generate_code
    GameSettings::VALID_COLORS.sample(GameSettings::CODE_LENGTH)
  end

  def store_code(code)
    @code = code
  end
end
