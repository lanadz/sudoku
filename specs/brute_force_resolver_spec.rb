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

  let(:board) { Sudoku::Board.new(input_matrix) }
  subject { described_class.new(board) }

  describe '#possible_optionals' do
    let(:possible_values) { [4] }

    it 'returns possible values for cell (2,3)' do
      cell = Sudoku::Cell.new(x: 2, y: 3, value: 0)
      expect(subject.possible_optionals(cell)).to eq [4]
    end

    it 'returns possible values for cell (2,8)' do
      cell = Sudoku::Cell.new(x: 0, y: 8, value: 0)
      expect(subject.possible_optionals(cell)).to eq [2, 8]
    end
  end

  describe '#main_loop' do
    it 'returns resolves the puzzle' do
      subject.main_loop

      board_values = subject.board.fields.map do |row|
        row.map(&:value)
      end

      expect(board_values).to eq result
    end
  end

  describe '#resolved?' do
    it 'returns true if resolved' do
      subject.main_loop

      expect(subject.resolved?).to be_truthy
    end

    it 'returns false if there are empty cells' do
      expect(subject.resolved?).to be_falsy
    end
  end
end
