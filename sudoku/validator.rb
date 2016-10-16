module Sudoku
  class InvalidBoardSizeError < StandardError
  end

  class InvalidBoardInputError < StandardError
  end

  class Validator
    def initialize(puzzle)
      @puzzle = puzzle
    end

    def validate
      validate_board_size
      validate_cell_values

      true
    end

    private

    attr_reader :puzzle

    def validate_board_size
      if puzzle.board.to_a.size != 9 || puzzle.board.to_a.any? { |row| row.size != 9 }
        raise InvalidBoardSizeError
      end
    end

    def validate_cell_values
      unless puzzle.board.to_a.flatten.all? { |cell| (0..9).include? cell }
        raise InvalidBoardInputError
      end
    end
  end
end
