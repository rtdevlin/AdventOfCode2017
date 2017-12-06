require File.expand_path('../../lib/checksum.rb', __FILE__)

describe Checksum do
  context '::get_evenly_divisible_quotient' do
    it 'will parse a space delimited string of numbers and return the quotient between the only divisible pair of numbers' do
      expect(described_class.get_evenly_divisible_quotient('5 9 2 8')).to eq 4
      expect(described_class.get_evenly_divisible_quotient('9 4 7 3')). to eq 3
      expect(described_class.get_evenly_divisible_quotient('3 8 6 5')). to eq 2
    end
  end

  context '::get_difference' do
    it 'will parse a space delimited string of numbers and return the difference between the largest and smallest number' do
      expect(described_class.get_difference('5 1 9 5')).to eq 8
      expect(described_class.get_difference('7 5 3')). to eq 4
      expect(described_class.get_difference('2 4 6 8')). to eq 6
    end
  end

  context '::add_numbers' do
    it 'will add numbers of an array and return the result' do
      expect(described_class.add_numbers [1,1,1,1]).to eq 4
      expect(described_class.add_numbers []).to eq 0
    end
  end

  context '::calculate_difference_checksum' do
    let(:spreadsheet) do
      <<~INPUT
        5 1 9 5
        7 5 3
        2 4 6 8
      INPUT
    end

    it 'will calculate checksum (add up difference between min and max number of each row)' do
      expect(described_class.calculate_difference_checksum(spreadsheet)).to eq 18
    end
  end

  context '::calculate_quotient_checksum' do
    let(:spreadsheet) do
      <<~INPUT
        5 9 2 8
        9 4 7 3
        3 8 6 5
      INPUT
    end

    it 'will calculate checksum (add up quotient between the evenly divisible numbers of each row)' do
      expect(described_class.calculate_quotient_checksum(spreadsheet)).to eq 9
    end
  end
end
