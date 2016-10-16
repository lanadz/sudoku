require_relative 'spec_helper'

RSpec.describe Sudoku::Validator do
  let(:board) { Sudoku::Board.new(input_matrix) }
  let(:puzzle) { Sudoku::Puzzle.new(board) }
  subject do
    described_class.new(puzzle)
  end

  context 'valid puzzle' do
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

    it 'returns true' do
      expect(subject.validate).to eq true
    end
  end

  context 'invalid puzzle size' do
    let(:input_matrix) do
      [
        [0, 0, 3, 5, 0, 6, 7, 0],
        [0, 7, 0, 1, 2, 8, 0, 0],
        [2, 0, 8, 0, 7, 0, 9, 1],
        [4, 2, 0, 0, 1, 0, 0, 3],
        [0, 8, 1, 6, 3, 5, 2, 0],
        [7, 3, 0, 0, 4, 0, 0, 9],
        [3, 0, 2, 0, 6, 0, 5, 7],
        [0, 0, 4, 2, 0, 7, 1, 0]
      ]
    end

    it 'raises error' do
      expect { subject.validate }.to raise_error Sudoku::InvalidBoardSizeError
    end
  end

  context 'invalid numbers in puzzle input' do
    let(:input_matrix) do
      [
        [10, 0, 3, 5, 0, 6, 7, 0, 0],
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

    it 'raises error' do
      expect { subject.validate }.to raise_error Sudoku::InvalidBoardInputError
    end
  end
end
