require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /index" do
    it "Should get index page" do
      get root_path
      expect(response.status).to be(200)
    end
    
    it "Should display header" do
      get root_path
      expect(response.body).to include("Welcome to the tax calculator app")
    end
  end
end
