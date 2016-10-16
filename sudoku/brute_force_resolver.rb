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
      present_values = board.get_row_by(cell: cell).map(&:value) |
                        board.get_col_by(cell: cell).map(&:value) |
                        board.get_box_by(cell: cell).map(&:value)
      (1..9).to_a - present_values
    end

    def execute
      @has_changes = true

      while @has_changes do
        @has_changes = false

        fill_with_optionals

        find_uniq_optionals unless @has_changes
      end
    end

    def find_uniq_optionals
      if !resolved?
        (0...9).each do |x|
          (0...9).each do |y|
            cell = board.fields[x][y]
            next if cell.has_value?

            if (new_value = unique_optional(cell))
              set_value(cell, new_value)
              next
            end
          end
        end
      end
    end

    def unique_optional(cell)
      unique_optionals = cell.optionals - board.get_row_by(cell: cell).map(&:optionals).flatten.uniq
      return unique_optionals.first if unique_optionals.size == 1

      unique_optionals = cell.optionals - board.get_col_by(cell: cell).map(&:optionals).flatten.uniq
      return unique_optionals.first if unique_optionals.size == 1

      unique_optionals = cell.optionals - board.get_box_by(cell: cell).map(&:optionals).flatten.uniq
      return unique_optionals.first if unique_optionals.size == 1

      nil
    end

    def cleanup_optionals(cell)
      board.get_row_by(cell: cell).each do |element|
        element.optionals.delete(cell.value)
      end

      board.get_col_by(cell: cell).each do |element|
        element.optionals.delete(cell.value)
      end

      board.get_box_by(cell: cell).each do |element|
        element.optionals.delete(cell.value)
      end
    end

    private

    def set_value(cell, result)
      cell.value = result
      cell.optionals = []
      @has_changes = true
      cleanup_optionals(cell)
    end

    def fill_with_optionals
      board.fields.each do |row|
        row.each do |cell|
          next if cell.has_value?

          opts = possible_optionals(cell)

          persist_value_if_one_optional_only(cell: cell, optionals: opts)
          persist_optionals(cell: cell, optionals: opts)
        end
      end
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
        cell.optionals = []
        @has_changes = true
      end
    end
  end
end
