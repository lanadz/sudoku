module Sudoku
  class Puzzle
    def initialize(board)
      @board = board
      Validator.new(@board).validate
      @resolver = Resolver.new(@board)
    end

    def solve
      @resolver = @resolver.execute
    end

    def resolved?
      @resolver.resolved?
    end

    def board
      @resolver.board
    end
  end
end
