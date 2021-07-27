require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  include Devise::Test::IntegrationHelpers
  describe 'GET /index when not logged in' do
    it 'gets index page' do
      get root_path
      expect(response.status).to be(200)
    end

    it 'displays header' do
      get root_path
      expect(response.body).to include('Welcome to the tax calculator app')
    end

    it 'displays login and signup links when not logged in' do
      get root_path
      expect(response.body).to include('Sign in' && 'Sign up')
    end

    it 'does not display logout and My account links when signed in' do
      get root_path
      expect(response.body).not_to include('Sign out' && 'My Account')
    end
  end

  describe 'GET /index when logged in' do
    before do
      user = User.create(email: 'test@example.com', password: '123456')
      sign_in(user)
    end

    it 'gets index page' do
      get root_path
      expect(response.status).to be(200)
    end

    it 'displays header' do
      get root_path
      expect(response.body).to include('Welcome to the tax calculator app')
    end

    it 'does not display login and signup links when not logged in' do
      get root_path
      expect(response.body).not_to include('Sign in' && 'Sign up')
    end

    it 'displays logout and My account links when signed in' do
      get root_path
      expect(response.body).to include('Sign out' && 'My Account')
    end
  end

  describe 'GET /new when not logged in' do
    it 'is status 302' do
      get new_static_page_path
      expect(response.status).to be(302)
    end

    it 'redirects to sign in page' do
      get new_static_page_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET /new when logged in' do
    before do
      user = User.create(email: 'test@example.com', password: '123456')
      sign_in(user)
    end

    it 'is status 200' do
      get new_static_page_path
      expect(response.status).to be(200)
    end
  end
end
