# frozen_string_literal: true

module Rules
  def pattern_match?(code, guess)
    code == guess
  end

  def key_peg_match(guess, code)
    key_peg_boolean = guess.map.with_index { |match, i| match == code[i] }
    key_peg_boolean.map! { |value| value == true ? :darkred : :white }
  end

end
