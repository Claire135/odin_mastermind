# frozen_string_literal: true

require_relative 'computer_player'
require_relative 'human_player'

module Rules
  # returns a bolean
  def pattern_match?(code, guess)
    code == guess
  end
end
