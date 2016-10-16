module Sudoku
  class Board
    attr_reader :fields

    def initialize(matrix)
      @fields = []

      matrix.each_with_index do |row_values, x_index|
        row = []
        row_values.each_with_index do |value, y_index|
          row << Cell.new(x: x_index, y: y_index, value: value)
        end
        @fields << row
      end
    end

    def get_row_by(cell:)
      row = []
      fields[cell.x].each do |element|
        next if element.y == cell.y
        row << element
      end
      row
    end

    def get_col_by(cell:)
      col = []
      (0...9).each do |x|
        next if x == cell.x
        col << fields[x][cell.y]
      end
      col
    end

    def get_box_by(cell:)
      top_left_x_of_box =containing_box_start_index(cell.x)
      top_left_y_of_box =containing_box_start_index(cell.y)

      final_x = top_left_x_of_box + 3
      final_y = top_left_y_of_box + 3
      box = []

      (top_left_x_of_box...final_x).each do |x|
        (top_left_y_of_box...final_y).each do |y|
          next if x == cell.x && y == cell.y
          box << fields[x][y]
        end
      end

      box
    end

    private

    def containing_box_start_index(index)
      case index
        when (0..2) then
          0
        when (3..5) then
          3
        when (6..8) then
          6
      end
    end
  end
end
