require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#cat_image' do
    it 'returns a url' do
      expect(cat_image).to include 'https://cdn2.thecatapi.com/images/' && '.jpg'
    end
  end
end
