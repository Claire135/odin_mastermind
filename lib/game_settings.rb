# frozen_string_literal: true

# Defines number of guesses, code length and valid colours.
# This can later be modified to become adjustable user settings - ie changing code length, no of guesses

class GameSettings
  CODE_LENGTH = 4
  MAX_GUESSES = 8
  VALID_COLORS = %i[red green orange blue purple yellow].freezemain
end
