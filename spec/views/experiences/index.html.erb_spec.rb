require 'rails_helper'
=begin
RSpec.describe "experiences/index", type: :view do
  before(:each) do
    assign(:experiences, [
      Experience.create!(
        :name => "Name",
        :description => "Description",
        :image_url => "Image Url",
        :sponsored => false
      ),
      Experience.create!(
        :name => "Name",
        :description => "Description",
        :image_url => "Image Url",
        :sponsored => false
      )
    ])
  end

  it "renders a list of experiences" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
=end
