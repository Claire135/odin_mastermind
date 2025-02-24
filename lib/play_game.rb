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
    puts "Debug: #{@computer.code}" #test
  end

  def player_turns
      guess_no = current_guess_no #tracked in HumanPlayer
      until guess_no == MAX_GUESSES || pattern_match? == true do
        @human.make_guess
        puts "Player guessed: #{@human.make_guess}." #debug
        @rules.pattern_match?(@computer.code, @human.make.guess)
      end
  end

  def end_game
    if @rules.pattern_match == true
      win_UI
    else lose_UI 
    end
    reset_board #Board Class
  end

  #def play_new_game
   # start_game
    #player_turns
    #end_game
  #end

end

new_game = PlayGame.new
new_game.start_game #debug