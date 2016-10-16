require_relative 'spec_helper'

RSpec.describe Sudoku::Board do
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

  subject { described_class.new(input_matrix) }

  it 'creates new bord and fills cells' do
    board_values = subject.fields.map do |row|
      row.map(&:value)
    end

    expect(board_values).to match_array input_matrix
  end

  describe '#get_row_by' do
    let(:expected_row_values) { [2, 8, 0, 7, 0, 9, 0, 1] }

    it 'gets row based on cell\'s index' do
      row = subject.get_row_by(cell: Sudoku::Cell.new(x: 2, y: 1, value: 0))
      expect(row.map(&:value)).to eq expected_row_values
    end
  end

  describe '#get_col_by' do
    let(:expected_col_values) { [0, 7, 2, 8, 3, 0, 6, 0] }

    it 'gets col based on cell\'s index' do
      col = subject.get_col_by(cell: Sudoku::Cell.new(x: 2, y: 1, value: 0))
      expect(col.map(&:value)).to eq expected_col_values
    end
  end

  describe '#get_box_by' do
    let(:expected_box_values) { [0, 1, 0, 6, 3, 0, 4, 0] }

    it 'gets box based on cell\'s index' do
      box = subject.get_box_by(cell: Sudoku::Cell.new(x: 4, y: 5, value: 0))
      expect(box.map(&:value)).to eq expected_box_values
    end
  end
end
