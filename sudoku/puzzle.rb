module Sudoku
  class Puzzle
    attr_reader :board

    def initialize(board)
      @board = board
    end

    def solve
      BruteForceResolver.new(@board).execute
    end
  end
end
