module Features
  def upload_file
    visit new_basket_path

    attach_file('File', "#{Rails.root}/spec/support/helpers/basket1.txt")
    click_button 'Submit'
  end
end
