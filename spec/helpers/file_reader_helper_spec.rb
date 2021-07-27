require 'rails_helper'

# describe StaticPagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe FileReaderHelper, type: :helper do
  describe "#line_constructor" do
    it "should return a hash" do
      line = "1 music CD at 14.99"
      expected = {
        quantity: "1",
        name: "music CD",
        price: "14.99"
      }
      expect(line_constructor(line)).to eq(expected)
    end
  end
end
