module Sudoku
  class BruteForceResolver
    attr_reader :board

    def initialize(board)
      @board = board
    end

    def resolved?
      board.fields.flatten.map(&:value).none?(&:zero?)
    end

    def possible_optionals(cell)
      present_values = []
      present_values << board.get_row_by(cell: cell).map(&:value)
      present_values << board.get_col_by(cell: cell).map(&:value)
      present_values << board.get_box_by(cell: cell).map(&:value)
      present_values.flatten!.uniq!
      (0..9).to_a - present_values
    end

    def main_loop
      @has_changes = true
      while @has_changes do
        @has_changes = false
        board.fields.each do |row|
          row.each do |cell|
            next if cell_has_value?(cell)

            opts = possible_optionals(cell)

            persist_value_if_one_optional_only(cell: cell, optionals: opts)
            persist_optionals(cell: cell, optionals: opts)
          end
        end
      end
      self
    end

    private

    def cell_has_value?(cell)
      cell.value != 0
    end

    def persist_optionals(cell:, optionals:)
      if optionals.size > 1 && cell.optionals.sort != optionals.sort
        cell.optionals = optionals
        @has_changes = true
      end
    end

    def persist_value_if_one_optional_only(cell:, optionals:)
      if optionals.size == 1
        cell.value = optionals.first
        @has_changes = true
      end
    end
  end
end
