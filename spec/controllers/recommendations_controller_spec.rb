require 'rails_helper'
require "facebook_authentication"

RSpec.describe RecommendationsController, type: :controller do
  include_context "facebook authentication"

  before(:each){
    experience = Experience.new(name: "Local1", description: "Descricao1", image_url: "https://url.com", sponsored: false)
    experience.save
    experience = Experience.new(name: "Local2", description: "Descricao2", image_url: "https://url.com", sponsored: true)
    experience.save
    experience = Experience.new(name: "Local3", description: "Descricao3", image_url: "https://url.com", sponsored: false)
    experience.save
    experience = Experience.new(name: "Local4", description: "Descricao4", image_url: "https://url.com", sponsored: false)
    experience.save
    experience = Experience.new(name: "Local5", description: "Descricao5", image_url: "https://url.com", sponsored: true)
    experience.save
  }

  let(:experiences){
    Experience.limit(4)
  }

  describe "POST #recommend" do
    it "returns a success response" do
      post :recommend, params: {}
      expect(response).to be_success
    end
    it "render the correct experiences" do
      post :recommend, params: {}
      experiences.each do |experience|
        experience.current_user = subject.current_user
      end
      @expected = experiences.to_json(methods: [:visited])
      expect(response.body).to eq(@expected)
    end
  end
end
