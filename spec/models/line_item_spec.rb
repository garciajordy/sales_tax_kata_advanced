require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe "#imported?" do
    it "should return false when not imported" do
      item = LineItem.new(quantity: 1, name: "music CD", price: 14.99)
      expect(item.imported?).to be_falsy
    end

    it "should return true when imported" do
      item = LineItem.new(quantity: 1, name: "imported box of chocolate", price: 14.99)
      expect(item.imported?).to be_truthy
    end
  end
end
