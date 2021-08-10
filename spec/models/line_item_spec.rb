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
    it 'returns the correct output of item1' do
      item = described_class.new(quantity: 1, name: 'imported bottle of perfume', price: 47.50)
      output = '1 imported bottle of perfume: 54.65'
      expect(item.output).to match(output)
    end

    it 'returns the correct output of item2' do
      item = described_class.new(quantity: 1, name: 'imported box of chocolates', price: 10)
      output = '1 imported box of chocolates: 10.50'
      expect(item.output).to match(output)
    end
  end

  describe '#category' do
    it 'returns food when the line_item is chocolate' do
      item = described_class.new(quantity: 1, name: 'imported box of chocolate', price: 14.99)
      expect(item.category).to match('food')
    end

    it 'returns medicine when the line_item is headache pills' do
      item = described_class.new(quantity: 1, name: 'packet of headache pills', price: 4.99)
      expect(item.category).to match('medicine')
    end

    it 'returns books when the line_item is a book' do
      item = described_class.new(quantity: 1, name: 'book', price: 5)
      expect(item.category).to match('books')
    end

    it 'returns others when the line_item is perfume' do
      item = described_class.new(quantity: 1, name: 'imported bottle of perfume', price: 54.99)
      expect(item.category).to match('others')
    end
  end
end
