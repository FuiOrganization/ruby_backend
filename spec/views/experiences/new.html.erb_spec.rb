require 'rails_helper'
=begin
RSpec.describe "experiences/new", type: :view do
  before(:each) do
    assign(:experience, Experience.new(
      :name => "MyString",
      :description => "MyString",
      :image_url => "MyString",
      :sponsored => false
    ))
  end

  it "renders new experience form" do
    render

    assert_select "form[action=?][method=?]", experiences_path, "post" do

      assert_select "input[name=?]", "experience[name]"

      assert_select "input[name=?]", "experience[description]"

      assert_select "input[name=?]", "experience[image_url]"

      assert_select "input[name=?]", "experience[sponsored]"
    end
  end
end
=end
