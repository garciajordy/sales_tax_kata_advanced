require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the BasketsHelper. For example:
#
# describe BasketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TaxCalculatorHelper, type: :helper do
  describe '#to_decimal' do
    it 'returns 10.00 when num is 10' do
      expect(to_decimal(10)).to match('10.00')
    end

    it 'returns 5.10 when num is 5.1' do
      expect(to_decimal(5.1)).to match('5.10')
    end
  end

  describe '#rounding' do
    it 'rounds 1.49 to 1.5' do
      expect(rounding(1.49)).to eq(1.5)
    end

    it 'rounds 1.46 to 1.5' do
      expect(rounding(1.46)).to eq(1.5)
    end

    it 'rounds 1.41 to 1.45' do
      expect(rounding(1.41)).to eq(1.45)
    end

    it 'does not round 1.40' do
      expect(rounding(1.40)).to eq(1.40)
    end

    it 'does not round 1.45' do
      expect(rounding(1.45)).to eq(1.45)
    end
  end

  describe '#total_sales_tax' do
    it 'calculates total sales tax' do
      user = User.create(email: 'test@example.com', password: '123456')
      basket = Basket.create(name: 'test_basket', user_id: user.id)
      LineItem.create(quantity: 1, name: 'imported bottle of perfume', price: 27.99, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'bottle of perfume', price: 18.99, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'packet of headache pills', price: 9.75, basket_id: basket.id)
      LineItem.create(quantity: 1, name: 'imported box of chocolates', price: 11.25, basket_id: basket.id)

      expect(basket.total_sales_tax).to eq('6.70')
    end
  end

  describe '#tax_percent' do
    it 'returns 15 when line_item is imported and category other' do
      item = LineItem.new(quantity: 1, name: 'imported bottle of perfume', price: 54.99)
      expect(item.tax_percent).to eq(15)
    end

    it 'returns 10 when line_item is category other' do
      item = LineItem.new(quantity: 1, name: 'bottle of perfume', price: 54.99)
      expect(item.tax_percent).to eq(10)
    end

    it 'returns 5 when line_item is imported' do
      item = LineItem.new(quantity: 1, name: 'imported box of chocolate', price: 54.99)
      expect(item.tax_percent).to eq(5)
    end

    it 'returns 0 when line_item is food' do
      item = LineItem.new(quantity: 1, name: 'box of chocolate', price: 54.99)
      expect(item.tax_percent).to eq(0)
    end
  end

  describe '#tax_calculator' do
    it 'returns the total sales tax of imported item' do
      item = LineItem.new(quantity: 1, name: 'imported box of chocolate', price: 10)
      expect(item.tax_calculator).to eq(0.5)
    end

    it 'returns the total sales tax of item from other category' do
      item = LineItem.new(quantity: 1, name: 'bottle of perfume', price: 10)
      expect(item.tax_calculator).to eq(1)
    end

    it 'returns the total sales tax of imported item from other category' do
      item = LineItem.new(quantity: 1, name: 'imported bottle of perfume', price: 10)
      expect(item.tax_calculator).to eq(1.5)
    end

    it 'returns 0 when item has no taxes' do
      item = LineItem.new(quantity: 1, name: 'book', price: 10)
      expect(item.tax_calculator).to eq(0)
    end
  end
end
