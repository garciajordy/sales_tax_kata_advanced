require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  include Devise::Test::IntegrationHelpers
  describe "GET /index when not logged in" do
    it "Should get index page" do
      get root_path
      expect(response.status).to be(200)
    end
    
    it "Should display header" do
      get root_path
      expect(response.body).to include("Welcome to the tax calculator app")
    end

    it "Should display login and signup links when not logged in" do
      get root_path
      expect(response.body).to include("Sign in" && "Sign up")
    end

    it "Shouldn't display logout and My account links when signed in" do
      get root_path
      expect(response.body).to_not include("Sign out" && "My Account")
    end
  end

  describe "GET /index when logged in" do
    before do
      user = User.create(email: "test@example.com", password: "123456")
      sign_in(user)
    end
    it "Should get index page" do
      get root_path
      expect(response.status).to be(200)
    end
    
    it "Should display header" do
      get root_path
      expect(response.body).to include("Welcome to the tax calculator app")
    end

    it "Shouldn't display login and signup links when not logged in" do
      get root_path
      expect(response.body).to_not include("Sign in" && "Sign up")
    end

    it "Should display logout and My account links when signed in" do
      get root_path
      expect(response.body).to include("Sign out" && "My Account")
    end
  end
end
