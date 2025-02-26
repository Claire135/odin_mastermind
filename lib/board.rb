# frozen_string_literal: true

# Controls the state of the board
require_relative 'displayable'

class Board
  attr_accessor :historic_pegs

  include Displayable

  def initialize(human, computer)
    @historic_pegs = []
    @human = human
    @computer = computer
  end

  def create_display_array(guess, code, current_guess_no)
    current_player_pegs = generate_player_pegs(guess)
    current_key_pegs = generate_key_pegs(guess, code)

    current_peg_array = [current_guess_no, current_player_pegs, current_key_pegs]
    @historic_pegs << current_peg_array
    puts "debug #{@historic_pegs}"
  end

  def reset_board
    @historic_pegs = clear
    Board.new
  end
end
