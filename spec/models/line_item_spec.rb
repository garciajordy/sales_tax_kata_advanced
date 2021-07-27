require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to(:basket) }
  end

  describe '#imported?' do
    it 'returns false when not imported' do
      item = described_class.new(quantity: 1, name: 'music CD', price: 14.99)
      expect(item).not_to be_imported
    end

    it 'returns true when imported' do
      item = described_class.new(quantity: 1, name: 'imported box of chocolate', price: 14.99)
      expect(item).to be_imported
    end
  end

  describe '#output' do
    it 'returns the correct output' do
      item = described_class.new(quantity: 1, name: 'imported box of chocolate', price: 14.99)
      output = '1 imported box of chocolate: 14.99'
      expect(item.output).to match(output)
    end
  end
end
