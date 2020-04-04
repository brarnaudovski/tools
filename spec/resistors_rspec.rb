require 'tools/resistors'

RSpec.describe Tools::Resistors do
  describe 'Full resistor specification' do
    it 'presents the specification' do
      resistor = Tools::Resistors.new(['Blue', 'Yellow', 'Red'])
      expected = '6400 ohms +/-20%'

      expect(resistor.specification).to eq expected
    end

    it 'presents the specification' do
      resistor = Tools::Resistors.new(['Blue', 'Yellow', 'Red', 'Gold'])
      expected = '6400 ohms +/-5%'

      expect(resistor.specification).to eq expected
    end

    it 'presents the specification' do
      resistor = Tools::Resistors.new(['Blue', 'Yellow', 'blue', 'Gold'])
      expected = '64000000 ohms +/-5%'

      expect(resistor.specification).to eq expected
    end
  end
end
