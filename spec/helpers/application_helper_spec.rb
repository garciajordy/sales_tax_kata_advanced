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
RSpec.describe ApplicationHelper, type: :helper do
  describe '#cat_image' do
    it 'returns a url' do
      expect(cat_image).to include 'https://cdn2.thecatapi.com/images/' && '.jpg'
    end
  end
end
