module Features
  def sign_in_user
    user = User.create(email: 'test@example.com', password: '123456')
    sign_in(user)
  end
end
