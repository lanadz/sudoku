require_relative 'spec_helper'

RSpec.describe Sudoku::Resolver do
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
end
