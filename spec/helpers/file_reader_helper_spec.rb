require 'rails_helper'

# describe StaticPagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe FileReaderHelper, type: :helper do
  describe '#line_constructor' do
    it 'returns a hash' do
      line = '1 music CD at 14.99'
      expected = {
        quantity: 1,
        name: 'music CD',
        price: 14.99
      }
      expect(line_constructor(line)).to eq(expected)
    end
  end

  describe '#line_item_constructor' do
    it 'creates line_item with valid data' do
      hash = {
        quantity: 1,
        name: 'music CD',
        price: 14.99
      }
      user = User.create(email: 'user@example.com', password: '123456')
      basket = user.baskets.create(name: 'test_basket')

      expect(LineItem.count).to eq(0)
      line_item_constructor(hash, basket.id)
      expect(LineItem.count).to eq(1)
    end

    it 'does not create line_item with invalid data' do
      hash = {
        quantity: 1,
        name: '',
        price: 14.99
      }
      user = User.create(email: 'user@example.com', password: '123456')
      basket = user.baskets.create(name: 'test_basket')

      expect(LineItem.count).to eq(0)
      line_item_constructor(hash, basket.id)

      expect(LineItem.count).to eq(0)
    end
  end
end
