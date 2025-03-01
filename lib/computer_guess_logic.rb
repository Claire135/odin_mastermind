class ComputerGuessLogic
  def initialize
    @available_colors = %i[red green orange blue purple yellow]
    @code = %i[blue green purple yellow]
    @locked_pegs = [nil, nil, nil, nil]
    @guess = guess
    @current_guess_no = 0
  end

  def guess
    Array.new(4) { @available_colors.sample }
  end

  def get_feedback(code, guess)
    guess.map.with_index { |match, i| match == code[i] ? :darkred : :white }
  end

  def assign_locked_pegs(code, guess)
    get_feedback(code, guess).each_with_index do |value, i|
      @locked_pegs[i] = guess[i] if value == :darkred
    end
  end

  def remove_color_from_available_colors(guess)
    guess.each_with_index do |color, i|
      @available_colors.delete(color) if color == @code[i]
    end
  end

  def white_pegs_guess_again
    @guess = @guess.map.with_index do |_color, i|
      @locked_pegs[i] || @available_colors.sample
    end
  end

  def make_guess
    assign_locked_pegs(@code, @guess)
    remove_color_from_available_colors(@guess)
    white_pegs_guess_again
    @current_guess_no += 1
  end
end
