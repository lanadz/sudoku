require_relative 'spec_helper'

RSpec.describe Sudoku::Cell do
  subject { described_class.new(x: 0, y: 1, value: 0) }
  it 'creates new cell' do
    expect(subject.x).to eq 0
    expect(subject.y).to eq 1
    expect(subject.value).to eq 0
  end

  it 'sets optionals' do
    subject.optionals = [3, 2]
    expect(subject.optionals).to match_array [2, 3]
  end

  it 'sets value' do
    subject.value = 3
    expect(subject.value).to eq 3
  end
end
