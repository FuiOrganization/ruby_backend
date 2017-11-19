require 'rails_helper'
require "facebook_authentication"

RSpec.describe CheckinController, type: :controller do
  include_context "facebook authentication"

  let(:experience){
    experience = Experience.new(name: "Local", description: "Descricao", image_url: "https://url.com", sponsored: false)
    experience.save
    experience
  }

  describe "POST #history" do
    it "returns a success response" do
      post :history, params: {}
      expect(response).to be_success
    end
  end

  describe "POST #checkin" do
    it "returns a success response" do
      post :checkin, params: {experience_id: experience.id}
      expect(response).to be_success
    end
    it "creates a new checkin" do
      post :checkin, params: {experience_id: experience.id}
      expect(assigns(:checkin).user_id).to eq(subject.current_user.id)
      expect(assigns(:checkin).experience_id).to eq(experience.id)
    end
    it "renders 200 status json if successfully" do
      post :checkin, params: {experience_id: experience.id}
      @expected = { success: true }.to_json
      expect(response.body).to eq(@expected)
      expect(response.status).to eq(200)
    end
    it "renders 500 status json if can't save checkin" do
      post :checkin, params: {experience_id: -1}
      @expected = { success: false }.to_json
      expect(response.body).to eq(@expected)
      expect(response.status).to eq(500)
    end
  end
end
