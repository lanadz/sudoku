module Sudoku
  class Board
    attr_reader :fields

    def initialize(matrix)
      @fields= []

      matrix.each_with_index do |row_values, x_index|
        row = []
        row_values.each_with_index do |value, y_index|
          row << Cell.new(x: x_index, y: y_index, value: value)
        end
        @fields << row
      end
    end
  end
end
