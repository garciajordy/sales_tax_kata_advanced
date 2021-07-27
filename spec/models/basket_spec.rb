require 'rails_helper'

RSpec.describe Basket, type: :model do
  describe "relationships" do
    it { is_expected.to have_many(:line_items) }
    it { is_expected.to belong_to(:user) }
  end
end
