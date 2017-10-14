require 'rails_helper'

RSpec.describe "experiences/edit", type: :view do
  before(:each) do
    @experience = assign(:experience, Experience.create!(
      :name => "MyString",
      :description => "MyString",
      :image_url => "MyString",
      :sponsored => false
    ))
  end

  it "renders the edit experience form" do
    render

    assert_select "form[action=?][method=?]", experience_path(@experience), "post" do

      assert_select "input[name=?]", "experience[name]"

      assert_select "input[name=?]", "experience[description]"

      assert_select "input[name=?]", "experience[image_url]"

      assert_select "input[name=?]", "experience[sponsored]"
    end
  end
end
