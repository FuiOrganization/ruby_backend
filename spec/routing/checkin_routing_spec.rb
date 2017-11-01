require "rails_helper"
RSpec.describe CheckinController, type: :routing do
  describe "routing" do
    it "routes to #checkin" do
      expect(post: "/checkin/checkin").to route_to("checkin#checkin")
    end
  end
end
