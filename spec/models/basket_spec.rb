require 'rails_helper'

RSpec.describe Basket, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:line_items).dependent :destroy }
    it { is_expected.to belong_to(:user) }
  end

  describe '#output' do
    it 'returns the correct output' do
      user = User.create(email: 'test@example.com', password: '123456')
      basket = described_class.create(name: 'test_basket', user_id: user.id)
      LineItem.create(quantity: 1, name: 'imported bottle of perfume', price: 27.99, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'bottle of perfume', price: 18.99, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'packet of headache pills', price: 9.75, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'box of imported chocolates', price: 11.25, basket_id: basket.id)
      output = ['1 imported bottle of perfume: 32.19', '1 bottle of perfume: 20.89', '1 packet of headache pills: 9.75', '1 box of imported chocolates: 11.85']

      expect(basket.output).to match(output)
    end
  end

  describe '#total' do
    it 'returns the total of all line_items' do
      user = User.create(email: 'test@example.com', password: '123456')
      basket = described_class.create(name: 'test_basket', user_id: user.id)
      LineItem.create(quantity: 1, name: 'imported box of chocolate', price: 14.99, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'imported perfume', price: 5.49, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'imported cheese', price: 10, basket_id: basket.id)

      expect(basket.total).to eq(30.48)
    end
  end
end
