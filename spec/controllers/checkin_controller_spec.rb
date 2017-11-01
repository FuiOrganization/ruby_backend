require 'rails_helper'
require "facebook_authentication"

RSpec.describe CheckinController, type: :controller do
  include_context "facebook authentication"

  let(:experience){
    experience = Experience.new(name: "Local", description: "Descricao", image_url: "https://url.com", sponsored: false)
    experience.save
    experience
  }

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
  end
end
