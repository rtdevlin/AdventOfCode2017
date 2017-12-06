require File.expand_path("../../lib/distance_calculator", __FILE__)
require 'pry'


describe DistanceCalculator do
  let(:klass) {described_class}
  context '::steps' do
    it 'will return the number of steps to read the number 1' do
      expect(klass.steps(1)).to eq 0
      expect(klass.steps(12)).to eq 3
      expect(klass.steps(23)).to eq 2
      expect(klass.steps(17)).to eq 4
      expect(klass.steps(25)).to eq 4
      expect(klass.steps(22)).to eq 3
      expect(klass.steps(1024)).to eq 31
    end
  end

  context '::find_rows' do
    it 'will return the number of rows in the array necessary to contain the argument' do
      expect(klass.find_rows(1)).to eq 1
      expect(klass.find_rows(2)).to eq 3
      expect(klass.find_rows(20)).to eq 5
    end
  end
end

