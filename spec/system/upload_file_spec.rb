require 'rails_helper'

RSpec.describe 'upload file', type: :system do
  describe 'when logged in' do
    include Devise::Test::IntegrationHelpers
    before do
      user = User.create(email: 'test@example.com', password: '123456')
      sign_in(user)
    end

    it 'shows file upload' do
      visit new_basket_path

      expect(page).to have_css "input[type='file']", text: ''
    end

    it 'uploads a file successfully' do
      visit new_basket_path

      attach_file('File', "#{Rails.root}/spec/support/helpers/basket1.txt")
      click_button 'Submit'

      expect(page).to have_content 'Successfully uploaded the file'
    end
  end
end
