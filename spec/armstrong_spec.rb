require 'tools/armstrong'

RSpec.describe Tools::Armstrong do
  subject(:armstrong) { described_class.new(number).valid? }

  context 'when the number is an Armstrong number' do
    let(:number) { 9 }

    it 'is valid number' do
      expect(armstrong).to be true
    end
  end

  context 'when the number is not an Armstrong number' do
    let(:number) { 10 }

    it 'is invalid number' do
      expect(armstrong).to be false
    end
  end

  context 'when we use three digits as an Armstrong number' do
    let(:number) { 153 }

    it 'is valid number' do
      expect(armstrong).to be true
    end
  end

  context 'when we use three digits as non Armstrong number' do
    let(:number) { 154 }

    it 'is invalid number' do
      expect(armstrong).to be false
    end
  end

  context 'when the number is negative Armstrong number' do
    let(:number) { -153 }

    it 'converts negative numbers to positive number before the check' do
      expect(armstrong).to be true
    end
  end
end
