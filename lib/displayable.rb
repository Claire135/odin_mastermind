require_relative 'game_settings'

module Displayable
  
  def valid_colors_UI
    valid_colors_string = GameSettings::VALID_COLORS.join(", ")
    puts "Valid colours: #{valid_colors_string}"
  end

end

include Displayable

valid_colors_UI