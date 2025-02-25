# frozen_string_literal: true

# Adds color to pegs for board display

require 'rainbow'
require_relative 'game_settings'

module Colorable
  def code_color(array)
    array.map { |color| Rainbow('O').bold.color(color)}.join(' ')
  end

  def valid_colors_colors(array)
    array.map { |color| Rainbow(color.to_s).bold.color(color)}.join(', ')
  end

end





