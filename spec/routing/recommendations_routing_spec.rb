require "rails_helper"
RSpec.describe RecommendationsController, type: :routing do
  describe "routing" do

    it "routes to #recommend" do
      expect(post: "/recommendations/recommend").to route_to("recommendations#recommend")
      expect(get: "/recommendations/recommend").to route_to("recommendations#recommend")
    end
  end
end
