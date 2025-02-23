# frozen_string_literal: true

# Adds color to pegs for board display

require 'colorize'

module Colorable
  def code_color(code)
    code.each { |color| puts "#{'O'.colorize(color)} " }
  end
end

include Colorable

code_color(%i[red green blue yellow]) # test
code_color(%i[white grey])
