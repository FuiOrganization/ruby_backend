require 'rails_helper'

RSpec.describe Experience, type: :model do
  it 'creates a new experience' do
    Experience.new(name: "Local", description: "Descricao", image_url: "https://url.com", sponsored: false).save
    experience = Experience.last
    expect(experience.name).to eq("Local")
    expect(experience.description).to eq("Descricao")
    expect(experience.image_url).to eq("https://url.com")
    expect(experience.sponsored).to be false
  end
end
