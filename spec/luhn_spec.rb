RSpec.describe Tools::Luhn do
  it "doesn't allow single digit string" do
    luhn = Tools::Luhn.new('1')
    expect(luhn.valid?).to be false
  end

  it "doesn't allow single zero string" do
    luhn = Tools::Luhn.new('0')
    expect(luhn.valid?).to be false
  end

  it 'remains valid if reversed' do
    luhn = Tools::Luhn.new('059')
    expect(luhn.valid?).to be true
  end

  it 'is valid input that becomes invalid if reveres' do
    luhn = Tools::Luhn.new('59') # 95
    expect(luhn.valid?).to be true
  end

  it 'is valid canadian social id' do
    luhn = Tools::Luhn.new('055 444 285')
    expect(luhn.valid?).to be true
  end

  it 'is invalid canadian social id' do
    luhn = Tools::Luhn.new('055 444 286')
    expect(luhn.valid?).to be false
  end

  it 'is invalid credit card' do
    luhn = Tools::Luhn.new('8273 1232 7352 0569')
    expect(luhn.valid?).to be false
  end

  it 'is valid number with an even number of digits' do
    luhn = Tools::Luhn.new('095 245 88')
    expect(luhn.valid?).to be true
  end

  it 'is invalid strings with a non digit included' do
    luhn = Tools::Luhn.new('055a 444 285')
    expect(luhn.valid?).to be false
  end

  it 'is invalid strings with a non digit added at the end' do
    luhn = Tools::Luhn.new('059a')
    expect(luhn.valid?).to be false
  end

  it 'is invalid strings with punctuation included' do
    luhn = Tools::Luhn.new('055-444-285')
    expect(luhn.valid?).to be false
  end

  it 'is invalid strings with symbols included' do
    luhn = Tools::Luhn.new('055£ 444$ 285')
    expect(luhn.valid?).to be false
  end

  it 'is invalid string with single zero with space' do
    luhn = Tools::Luhn.new(' 0')
    expect(luhn.valid?).to be false
  end

  it 'is invalid with more than a single zero' do
    luhn = Tools::Luhn.new('0000 0')
    expect(luhn.valid?).to be true
  end

  it 'strings with non digits is invalid' do
    luhn = Tools::Luhn.new(':9')
    expect(luhn.valid?).to be false
  end
end
