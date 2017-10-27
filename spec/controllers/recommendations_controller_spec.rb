require 'rails_helper'
require "facebook_authentication"

RSpec.describe RecommendationsController, type: :controller do
  include_context "facebook authentication"
  describe "POST #recommend" do
    it "returns a success response" do
      post :recommend, params: {}
      expect(response).to be_success
    end
  end
end
