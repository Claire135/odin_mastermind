require_relative 'computer_player'
require_relative 'human_player'

module Rules
  def pattern_match?(code, guess) # returns a bolean
    code == guess
  end
end




