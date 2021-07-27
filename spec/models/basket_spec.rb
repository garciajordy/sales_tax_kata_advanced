require 'rails_helper'

RSpec.describe Basket, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:line_items).dependent :destroy }
    it { is_expected.to belong_to(:user) }
  end
end
