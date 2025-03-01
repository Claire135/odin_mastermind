# frozen_string_literal: true

# Controls the state of the board
require_relative 'rules'
require_relative 'displayable'

class Board
  attr_accessor :historic_pegs

  include Displayable
  include Rules

  def initialize(human, computer)
    @historic_pegs = []
    @human = human
    @computer = computer
  end

  def key_peg_boolean(guess, code)
    key_peg_boolean = guess.map.with_index { |val, i| val == code[i] }
    key_peg_boolean.map! { |value| value == true ? :darkred : :white }
  end

  def create_display_array(guess, code, current_guess_no)
    current_peg_array = [current_guess_no, guess, key_peg_match(guess, code)]
    @historic_pegs << current_peg_array
  end
end
