module Sudoku
  class PuzzlePresenter
    def initialize(puzzle)
      @puzzle = puzzle
    end

    def content
      @puzzle.board.to_a.map do |row|
        row.join(' ')
      end.join("\n")
    end
  end
end
