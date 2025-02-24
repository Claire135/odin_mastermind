# Generates player board
# Controls UI

require_relative 'game_settings'
require_relative 'colorable'

module Displayable

  def rules_UI
    puts "You have 8 guesses to crack the code. Grey pegs mean you got the color and position right, white means you didn't."
  end
  
  def valid_colors_UI
    valid_colors_string = GameSettings::VALID_COLORS.join(", ")
    puts "Valid colours: #{valid_colors_string}"
  end

  def win_UI
    puts 'Well done you cracked the code!'
  end

  def lose_UI
    puts "You'd never be hired by the secret services. Do better next time."
  end
end
