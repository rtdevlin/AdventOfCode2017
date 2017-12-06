require '../lib/number_counter'
describe NumberCounter do
  context '::get_numbers' do
    context 'default' do
      it 'will return numbers from input which match the number proceeding it, in a circular list (last digit checks first digit)' do

        expect(described_class.get_numbers([1,1,2,2])).to eq [1,2]
        expect(described_class.get_numbers([1,1,1,1])).to eq [1,1,1,1]
        expect(described_class.get_numbers([1,2,3,4])).to eq []
        expect(described_class.get_numbers([9,1,2,1,2,1,2,9])).to eq [9]
      end
    end

    context 'different advance' do
      it 'will return numbers from input which match the number x numbers proceeding it, in a circular list (last digit checks first digit)' do
        expect(described_class.get_numbers([1,2,1,2],2)).to eq [1,2,1,2]
        expect(described_class.get_numbers([1,2,2,1],2)).to eq []
        expect(described_class.get_numbers([1,2,3,4,2,5],3)).to eq [2,2]
        expect(described_class.get_numbers([1,2,3,1,2,3], 3)).to eq [1,2,3,1,2,3]
        expect(described_class.get_numbers([1,2,1,3,1,4,1,5], 4)).to eq [1,1,1,1]
      end
    end
  end

  context '::add_numbers' do
    it 'will add numbers of an array and return the result' do
      expect(described_class.add_numbers [1,1,1,1]).to eq 4
      expect(described_class.add_numbers []).to eq 0
    end
  end
end
