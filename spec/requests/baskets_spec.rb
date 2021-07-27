require 'rails_helper'

RSpec.describe 'Baskets', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /new when logged in' do
    before do
      user = User.create(email: 'test@example.com', password: '123456')
      sign_in(user)
    end

    it 'is status 200' do
      get new_basket_path
      expect(response.status).to be(200)
    end
  end

  describe 'When logged in' do
    before do
      user = User.create(email: 'test@example.com', password: '123456')
      sign_in(user)
    end

    describe 'GET /index' do
      it 'returns http success' do
        get '/baskets/index'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /show' do
      it 'returns http success' do
        get '/baskets/show'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /new' do
      it 'returns http success' do
        get new_basket_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'When not logged in' do
    describe 'GET /index' do
      it 'returns http 302' do
        get '/baskets/index'
        expect(response).to have_http_status(:found)
      end

      it 'redirects to sign in page' do
        get new_basket_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET /show' do
      it 'returns http 302' do
        get '/baskets/show'
        expect(response).to have_http_status(:found)
      end

      it 'redirects to sign in page' do
        get new_basket_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET /new' do
      it 'returns http 302' do
        get new_basket_path
        expect(response.status).to be(302)
      end

      it 'redirects to sign in page' do
        get new_basket_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
