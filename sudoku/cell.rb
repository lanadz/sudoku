module Sudoku
  class Cell
    attr_reader :x, :y
    attr_accessor :value, :optionals

    def initialize(x:, y:, value:)
      @x = x
      @y = y
      @value = value
      @optionals = []
    end

    def has_value?
      @value != 0
    end
  end
end
