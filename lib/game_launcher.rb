require_relative 'play_game_human_guess'
require_relative 'play_game_computer_guess'

class GameLauncher
  def self.start
    puts "Please pick a mode:"
    puts "Code-Breaker Mode (press 1)"
    puts "Code-Maker Mode (press 2)"

    input = gets.chomp.to_i

    if input == 1
      code_breaker = PlayGameHumanGuess.new
      code_breaker.play_game
    elsif input == 2
      code_maker = PlayGameComputerGuess.new
      code_maker.play_game
    else
      puts "Invalid choice. Please restart and enter 1 or 2."
    end
  end
end