require 'rails_helper'

RSpec.describe 'delete file', type: :system do
  describe '#destroy' do
    it 'successfullies destroy a basket' do
      user = User.create(email: 'test@example.com', password: '123456')
      sign_in_user(user)
      Basket.create(name: 'test_basket', user_id: user.id)
      visit baskets_path

      click_on 'Delete'
      page.accept_alert

      expect(page).to have_text('You have successfully destroyed the receipt.')
    end
  end
end
