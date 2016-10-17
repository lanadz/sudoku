module Sudoku
  class InvalidBoardSizeError < StandardError
  end

  class InvalidBoardInputError < StandardError
  end

  class Validator
    def initialize(board)
      @board = board
    end

    def validate
      validate_board_size
      validate_cell_values

      true
    end

    private

    attr_reader :board

    def validate_board_size
      if board.to_a.size != 9 || board.to_a.any? { |row| row.size != 9 }
        raise InvalidBoardSizeError
      end
    end

    def validate_cell_values
      unless board.to_a.flatten.all? { |cell| (0..9).include? cell }
        raise InvalidBoardInputError
      end
    end
  end
end
