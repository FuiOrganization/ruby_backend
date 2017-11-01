require 'rails_helper'

RSpec.describe Checkin, type: :model do
  let(:user){
    user = User.new(name: "Guilherme", email: "guilherme@gmail.com", facebook_identifier: 1)
    user.save
    user
  }

  let(:experience){
    experience = Experience.new(name: "Local", description: "Descricao", image_url: "https://url.com", sponsored: false)
    experience.save
    experience
  }

  it 'creates a new checkin' do
    Checkin.new(user_id: user.id, experience_id: experience.id).save
    checkin = Checkin.last
    expect(checkin.user_id).to eq(user.id)
    expect(checkin.experience_id).to eq(experience.id)
  end

end
