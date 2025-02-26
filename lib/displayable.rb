# frozen_string_literal: true

# Generates player board
# Controls UI

require_relative 'game_settings'
require_relative 'colorable'
require 'rainbow'

module Displayable
  include Colorable

  def generate_key_pegs(code_array)
    code_color(code_array)
  end

  def generate_player_pegs(guess)
    code_color(guess)
  end

  def display_board(array)
    array.each { |entry| puts "#{entry[0]} | #{generate_player_pegs(entry[1])} | #{generate_key_pegs(entry[2])}" }
  end

  def rules_UI
    puts "You have 8 guesses to crack the code. #{Rainbow('Dark red').bold.darkred} pegs mean you got the color and position right, #{Rainbow('white').bold.white} means you didn't."
  end

  def valid_colors_UI
    puts "Valid colours: #{valid_colors_colors(GameSettings::VALID_COLORS)}"
  end

  def win_UI
    puts 'Well done you cracked the code!'
  end

  def lose_UI
    puts "You'd never be hired by the secret services. Do better next time."
  end
end
