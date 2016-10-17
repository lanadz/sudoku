module Sudoku
  class BoardPresenter
    def initialize(puzzle)
      @board = puzzle
    end

    def content
      @board.to_a.map do |row|
        row.join(' ')
      end.join("\n")
    end
  end
end
