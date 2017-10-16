require 'rails_helper'

RSpec.describe "experiences/show", type: :view do
  before(:each) do
    @experience = assign(:experience, Experience.create!(
      :name => "Name",
      :description => "Description",
      :image_url => "Image Url",
      :sponsored => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/false/)
  end
end
