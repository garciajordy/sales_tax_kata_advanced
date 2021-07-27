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
  end
end
