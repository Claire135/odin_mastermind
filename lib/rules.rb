# frozen_string_literal: true

module Rules
  def pattern_match?(code, guess)
    code == guess
  end

  def key_peg_match(guess, code)
    key_peg_boolean = guess.map.with_index { |match, i| match == code[i] }
    key_peg_boolean.map! { |value| value == true ? :darkred : :white }
  end

  def create_computer_guess_array(guess, code)
    remaining_colors = GameSettings::VALID_COLORS.dup

    guess_boolean = match_colors(guess, code)

    update_correct_guesses(guess, code, guess_boolean, remaining_colors)
    fill_in_false_guesses(guess, guess_boolean, remaining_colors)

    guess
  end

  # Helper method to match the guess with the code and return boolean array
  def match_colors(guess, code)
    guess.map.with_index { |match, i| match == code[i] }
  end

  # Helper method to update the correct guesses
  def update_correct_guesses(guess, code, guess_boolean, remaining_colors)
    guess_boolean.each_with_index do |boolean, i|
      if boolean == true
        guess[i] = code[i]
        remaining_colors.delete(code[i])
      end
    end
  end

  # Helper method to fill in false guesses with random colors
  def fill_in_false_guesses(guess, guess_boolean, remaining_colors)
    guess_boolean.each_with_index do |boolean, i|
      guess[i] = remaining_colors.sample if boolean == false
    end
  end
end
