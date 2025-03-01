# frozen_string_literal: true

# Generates player board
# Generates key peg display
# Controls UI

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

  def display_secret_code(code)
    puts '---------------------- '
    puts "C | #{generate_player_pegs(code)}"
    puts ""
  end

  def rules_ui(player)
    puts "#{player} 8 guesses to crack the code. #{Rainbow('Dark red').bold.darkred} pegs mean the color and position are right, #{Rainbow('white').bold.white} means they aren't."
  end

  def valid_colors_ui
    puts "Valid colours: #{valid_colors_colors(GameSettings::VALID_COLORS)}"
  end

  def human_win_ui
    puts 'Well done you cracked the code!'
  end

  def human_lose_ui
    puts "You'd never be hired by the secret services. Do better next time."
  end

  def computer_win_ui(guess_no)
    puts "Computer won in #{guess_no} guesses!"
  end

  def computer_lose_ui
    puts "The computer couldn't even crack your code. Well done you!"
  end

  def play_again_prompt
    puts "Do you want to play again? (y/n)"
    input = gets.chomp.downcase
    if input == "y"
      GameLauncher.start
    else
      puts "Thanks for playing!"
      exit
    end
  end
end
