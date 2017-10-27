require 'rails_helper'

RSpec.describe User, type: :model do
  let(:facebook_user_data){
    data = Hash.new
    data["first_name"] = "Guilherme"
    data["email"] = "guilherme@gmail.com"
    data
  }

  let(:facebook_identifier){ "1" }

  it 'creates a new facebook user' do
    user = User.create_facebook_user(facebook_identifier, facebook_user_data)
    expect(user.name).to eq("Guilherme")
    expect(user.email).to eq("guilherme@gmail.com")
    expect(user.facebook_identifier).to eq("1")
  end

end
