require 'rails_helper'

RSpec.describe 'upload file', type: :system do
  describe 'when logged in' do
    before do
      sign_in_user
    end

    it 'shows file upload' do
      visit new_basket_path

      expect(page).to have_css "input[type='file']", text: ''
    end

    it 'uploads a file successfully' do
      upload_file

      expect(page).to have_content 'Successfully uploaded the file'
    end

    it 'uploads file and show the correct output' do
      upload_file

      expect(page).to have_css 'li', text: '1 music CD: 16.49' && '1 chocolate bar: 0.85' && 'Sales Taxes: 1.50' && 'Total: 29.83'
    end

    it 'onlies dispay current_user uploaded files' do
      user = User.create(email: 'test@gmail.com', password: '123456')
      other_user = User.create(email: 'other_test@gmail.com', password: '123456')
      Basket.create(name: 'test1', user_id: other_user.id)
      sign_in_user(user)
      upload_file

      visit baskets_path
      expect(page).to have_content(user.baskets.first.name)
      expect(page).not_to have_content(other_user.baskets.first.name)
    end
  end
end
