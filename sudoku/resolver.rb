module Sudoku
  class Resolver
    attr_reader :board

    def initialize(board)
      @board = board
    end

    def possible_optionals(cell)
      present_values = []
      present_values << board.get_row_by(cell: cell).map(&:value)
      present_values << board.get_col_by(cell: cell).map(&:value)
      present_values << board.get_box_by(cell: cell).map(&:value)
      present_values.flatten!.uniq!
      (0..9).to_a - present_values
    end
  end
end
