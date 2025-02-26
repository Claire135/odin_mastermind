# frozen_string_literal: true

# Computer generates master code for player to break

require_relative 'game_settings'

class ComputerPlayer
  attr_accessor :code

  def initialize
    @code = []
  end

  def generate_code
    GameSettings::VALID_COLORS.sample(GameSettings::CODE_LENGTH)
  end

  def store_code(code)
    @code = code
  end
end
