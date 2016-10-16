require_relative 'spec_helper'

RSpec.describe Sudoku::BruteForceResolver do
  let(:input_matrix) do
    [
      [0, 0, 3, 5, 0, 6, 7, 0, 0],
      [0, 7, 0, 1, 2, 8, 0, 4, 0],
      [2, 0, 8, 0, 7, 0, 9, 0, 1],
      [4, 2, 0, 0, 1, 0, 0, 5, 3],
      [0, 8, 1, 6, 3, 5, 2, 7, 0],
      [7, 3, 0, 0, 4, 0, 0, 1, 9],
      [3, 0, 2, 0, 6, 0, 5, 0, 7],
      [0, 6, 0, 3, 8, 1, 0, 9, 0],
      [0, 0, 4, 2, 0, 7, 1, 0, 0]
    ]
  end

  let(:result) do
    [
      [1, 4, 3, 5, 9, 6, 7, 2, 8],
      [6, 7, 9, 1, 2, 8, 3, 4, 5],
      [2, 5, 8, 4, 7, 3, 9, 6, 1],
      [4, 2, 6, 7, 1, 9, 8, 5, 3],
      [9, 8, 1, 6, 3, 5, 2, 7, 4],
      [7, 3, 5, 8, 4, 2, 6, 1, 9],
      [3, 1, 2, 9, 6, 4, 5, 8, 7],
      [5, 6, 7, 3, 8, 1, 4, 9, 2],
      [8, 9, 4, 2, 5, 7, 1, 3, 6]
    ]
  end

  let(:input_matrix_2) do
    [
      [0, 0, 0, 6, 7, 4, 0, 0, 0],
      [6, 5, 0, 0, 0, 0, 0, 4, 9],
      [0, 0, 0, 9, 0, 8, 0, 0, 0],
      [0, 0, 1, 7, 8, 9, 6, 0, 0],
      [0, 0, 9, 5, 0, 2, 4, 0, 0],
      [0, 0, 6, 3, 4, 1, 5, 0, 0],
      [0, 0, 0, 4, 0, 7, 0, 0, 0],
      [3, 7, 0, 0, 0, 0, 0, 1, 6],
      [0, 0, 0, 8, 3, 6, 0, 0, 0]
    ]
  end

  let(:result_2) do
    [
      [9, 2, 3, 6, 7, 4, 1, 5, 8],
      [6, 5, 8, 1, 2, 3, 7, 4, 9],
      [4, 1, 7, 9, 5, 8, 3, 6, 2],
      [5, 4, 1, 7, 8, 9, 6, 2, 3],
      [7, 3, 9, 5, 6, 2, 4, 8, 1],
      [2, 8, 6, 3, 4, 1, 5, 9, 7],
      [8, 6, 2, 4, 1, 7, 9, 3, 5],
      [3, 7, 4, 2, 9, 5, 8, 1, 6],
      [1, 9, 5, 8, 3, 6, 2, 7, 4]
    ]
  end

  let(:input_matrix_3) do
    [
      [0, 3, 0, 0, 6, 8, 0, 0, 0],
      [0, 4, 0, 0, 0, 0, 0, 0, 1],
      [1, 0, 0, 3, 0, 0, 0, 7, 0],
      [7, 2, 0, 0, 5, 0, 8, 0, 0],
      [0, 0, 4, 0, 0, 0, 6, 0, 0],
      [8, 0, 0, 0, 0, 9, 2, 0, 0],
      [0, 0, 0, 0, 2, 0, 0, 0, 0],
      [5, 0, 1, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 5, 0, 9, 0]
    ]
  end

  let(:board_1) { Sudoku::Board.new(input_matrix) }
  let(:board_2) { Sudoku::Board.new(input_matrix_2) }
  let(:board_3) { Sudoku::Board.new(input_matrix_3) }
  subject(:puzzle_1) { described_class.new(board_1) }
  subject(:puzzle_2) { described_class.new(board_2) }
  subject(:puzzle_3) { described_class.new(board_3) }

  describe '#possible_optionals' do
    context 'puzzle 2' do
      it 'returns possible values for cell (0,0)' do
        cell = Sudoku::Cell.new(x: 0, y: 0, value: 0)
        expect(puzzle_2.possible_optionals(cell)).to eq [1, 2, 8, 9]
      end

      it 'returns possible values for cell (1,4)' do
        cell = Sudoku::Cell.new(x: 1, y: 4, value: 0)
        expect(puzzle_2.possible_optionals(cell)).to eq [1, 2]
      end
    end

  end

  describe '#execute' do
    context 'puzzle 1' do
      it 'returns resolves the puzzle' do
      puzzle_1.execute

      board_values = puzzle_1.board.fields.map do |row|
        row.map(&:value)
      end
      expect(board_values).to eq result
      end
    end

    context 'puzzle 2' do
      it 'returns resolves the puzzle' do
        puzzle_2.execute

        board_values = puzzle_2.board.fields.map do |row|
          row.map(&:value)
        end

        expect(board_values).to eq result_2
      end
    end

    context 'puzzle 3' do
      it 'returns resolves the puzzle' do
        puzzle_3.execute

        board_values = puzzle_3.board.fields.map do |row|
          puts row.map(&:value).join(' ')
        end

      end
    end

    context 'eliminate_optionals' do
      let(:input_matrix_3) do
        [
          [0, 3, 0, 0, 6, 8, 0, 0, 0],
          [0, 4, 0, 0, 0, 0, 0, 0, 1],
          [1, 0, 0, 3, 0, 0, 0, 7, 0],
          [7, 2, 0, 0, 5, 0, 8, 0, 0],
          [0, 0, 4, 0, 0, 0, 6, 0, 0],
          [8, 0, 0, 0, 0, 9, 2, 0, 0],
          [0, 0, 0, 0, 2, 0, 0, 0, 0],
          [5, 0, 1, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 5, 0, 9, 0]
        ]
      end
      it 'returns resolves the puzzle' do
        cell = Sudoku::Cell.new(value: 1, x: 0, y: 0)
        other_cell_in_the_row = board_3.fields[0][1]
        other_cell_in_the_row.optionals = [1, 2]
        other_cell_in_the_col = board_3.fields[1][0]
        other_cell_in_the_col.optionals = [1, 3]
        other_cell_in_the_box = board_3.fields[1][1]
        other_cell_in_the_box.optionals = [2]

        puzzle_3.cleanup_optionals(cell)

        expect(other_cell_in_the_row.optionals).to eq [2]
        expect(other_cell_in_the_col.optionals).to eq [3]
        expect(other_cell_in_the_box.optionals).to eq [2]
      end
    end
  end

  describe '#resolved?' do
    it 'returns true if resolved' do
      puzzle_1.execute

      expect(puzzle_1.resolved?).to be_truthy
    end

    it 'returns false if there are empty cells' do
      expect(puzzle_1.resolved?).to be_falsy
    end
  end
end
