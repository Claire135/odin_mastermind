# Controls game flow
# controls player creation
require_relative 'displayable'
require_relative 'computer_player'
require_relative 'human_player'
require_relative 'rules'

class PlayGame
  include Displayable
  include Rules

  def initialize
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
  end

  def start_game
    rules_UI
    @computer.store_code(@computer.generate_code)
    puts "Debug cOMP CODE: #{@computer.code}" # test
  end

  def player_turns
    until @human.current_guess_no == GameSettings::MAX_GUESSES || pattern_match?(@computer.code, @human.guess) == true
      valid_colors_UI # Displayable
      @human.make_guess
     # @human.store_current_guess_no(@human.current_guess_no)
      puts "Debug Player guessed: #{@human.guess}." # debug
      pattern_match?(@computer.code, @human.guess)
    end
  end

  def end_game
    if pattern_match?(@computer.code, @human.guess) == true
      win_UI
    else
      lose_UI
    end
    reset_board # Board Class
  end

  def play_new_game
    start_game
    player_turns
    end_game
  end
end

new_game = PlayGame.new
new_game.play_new_game # debug
