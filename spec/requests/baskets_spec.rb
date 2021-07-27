require 'rails_helper'

RSpec.describe 'Baskets', type: :request do
  describe 'When logged in' do
    before do
      sign_in_user
    end

    describe 'GET /index' do
      it 'returns http success' do
        get baskets_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /show' do
      it 'returns http success' do
        user = User.first
        basket = Basket.create(name: 'test_basket', user_id: user.id)
        LineItem.create(quantity: 1, name: 'imported box of chocolate', price: 14.99, basket_id: basket.id)
        get basket_path(basket)
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
        get baskets_path
        expect(response).to have_http_status(:found)
      end

      it 'redirects to sign in page' do
        get new_basket_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET /show' do
      it 'returns http 302' do
        user = User.create(email: 'test@example.com', password: '123456')
        basket = Basket.create(name: 'test_basket', user_id: user.id)
        LineItem.create(quantity: 1, name: 'imported box of chocolate', price: 14.99, basket_id: basket.id)
        get basket_path(basket)
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
