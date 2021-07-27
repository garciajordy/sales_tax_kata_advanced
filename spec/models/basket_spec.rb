require 'rails_helper'

RSpec.describe Basket, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:line_items).dependent :destroy }
    it { is_expected.to belong_to(:user) }
  end

  describe '#output' do
    it 'returns the correct output' do
      user = User.create(email: "test@example.com", password: "123456")
      basket = Basket.create(name: "test_basket", user_id: user.id)
      LineItem.create(quantity: 1, name: 'imported box of chocolate', price: 14.99, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'imported perfume', price: 5.49, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'imported cheese', price: 10, basket_id: basket.id)
      output = ['1 imported box of chocolate: 14.99', "1 imported perfume: 5.49", "1 imported cheese: 10.00"]
      expect(basket.output).to match(output)
    end
  end

  describe "#total" do
    it "should return the total of all line_items" do
      user = User.create(email: "test@example.com", password: "123456")
      basket = Basket.create(name: "test_basket", user_id: user.id)
      LineItem.create(quantity: 1, name: 'imported box of chocolate', price: 14.99, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'imported perfume', price: 5.49, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'imported cheese', price: 10, basket_id: basket.id)

      expect(basket.total).to eq(30.48)
    end
  end


end
