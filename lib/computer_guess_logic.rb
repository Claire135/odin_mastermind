module ComputerGuessLogic
  def guess
    Array.new(4) { @available_colors.sample }
  end

  def get_feedback(code, guess)
    guess.map.with_index { |match, i| match == code[i] ? :darkred : :white }
  end

  def assign_locked_pegs(code, guess, locked_pegs)
    get_feedback(code, guess).each_with_index do |value, i|
      locked_pegs[i] = guess[i] if value == :darkred
    end
  end

  def remove_color_from_available_colors(guess)
    guess.each_with_index do |color, i|
      @available_colors.delete(color) if color == code[i]
    end
  end

  def white_pegs_guess_again(guess, locked_pegs, available_colors)
    guess.map!.with_index do |color, i|
      locked_pegs[i] ? locked_pegs[i] : available_colors.sample
    end
  end
end