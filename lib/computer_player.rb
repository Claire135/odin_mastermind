# frozen_string_literal: true

# Generates master code for player to break
# Stores code and computer guess depending on mode
# Generates guesses in Computer code breaker mode

require_relative 'rules'
require_relative 'game_settings'
require_relative 'player'
require_relative 'computer_guess_logic'

class ComputerPlayer < Player
  attr_accessor :locked_pegs

  include Rules
  include ComputerGuessLogic

  def initialize
    super()
    @available_colors = GameSettings::VALID_COLORS.dup
    @locked_pegs = Array.new(4)
    @guess = guess
  end
  
  def generate_code
    GameSettings::VALID_COLORS.sample(GameSettings::CODE_LENGTH)
  end

  def make_guess(code)
    assign_locked_pegs(code, @guess, @locked_pegs)
    remove_color_from_available_colors(@guess)
    white_pegs_guess_again(@guess, @locked_pegs, @available_colors)
    @current_guess_no += 1
  end
  
  def store_code(code)
    @code = code
  end

end

