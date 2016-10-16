require_relative 'spec_helper'

RSpec.describe Sudoku::Puzzle do
  let(:board) { Sudoku::Board.new(input_matrix) }
  subject do
    described_class.new(board)
  end

  context 'puzzle 1' do
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

    describe '#solve' do
      it 'solves the puzzle' do
        subject.solve

        board_values = subject.board.fields.map do |row|
          row.map(&:value)
        end

        expect(board_values).to eq result
      end
    end
  end

  context 'puzzle 2' do
    let(:input_matrix) do
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

    let(:result) do
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

    describe '#solve' do
      it 'solves the puzzle' do
        subject.solve

        board_values = subject.board.fields.map do |row|
          row.map(&:value)
        end

        expect(board_values).to eq result
      end
    end
  end

  context 'puzzle 3' do
    let(:input_matrix) do
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

    describe '#solve' do
      it 'solves the puzzle' do
        subject.solve

        expect(subject.board.resolved?).to be_falsy
      end
    end
  end
end
