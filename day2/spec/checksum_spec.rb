require File.expand_path('../../lib/checksum.rb', __FILE__)

describe Checksum do
  context '#get_difference' do
    it 'will parse a space delimited string of numbers and return the difference between the largest and smallest number' do
      expect(described_class.get_difference('5 1 9 5')).to eq 8
      expect(described_class.get_difference('7 5 3')). to eq 4
      expect(described_class.get_difference('2 4 6 8')). to eq 6
    end
  end

  context '#add_numbers' do
    it 'will add numbers of an array and return the result' do
      expect(described_class.add_numbers [1,1,1,1]).to eq 4
      expect(described_class.add_numbers []).to eq 0
    end
  end

  context '#calculate_checksum' do
    let(:spreadsheet) do
      <<~INPUT
        5 1 9 5
        7 5 3
        2 4 6 8
      INPUT
    end

    it 'will calculate checksum (add up difference between min and max number of each row)' do
      expect(described_class.calculate_checksum(spreadsheet)).to eq 18
    end
  end
end
