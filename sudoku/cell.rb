module Sudoku
  class Cell
    attr_reader :x, :y, :value
    attr_accessor :optionals

    def initialize(x:, y:, value:)
      @x = x
      @y = y
      @value = value
      @optionals = []
    end

    def has_value?
      @value != 0
    end

    def value=(new_value)
      @value = new_value
      @optionals = []
    end
  end
end
