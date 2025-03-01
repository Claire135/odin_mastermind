# frozen_string_literal: true

class Player
  attr_accessor :guess, :current_guess_no, :code

  def initialize
    @current_guess_no = 0
    @guess = []
    @code = []
  end

  def increment_guess_no
    @current_guess_no += 1
  end

  def store_current_guess_no(_guess)
    @current_guess_no = current_guess_no
  end
end
