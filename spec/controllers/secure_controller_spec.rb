require 'rails_helper'
require "facebook_authentication"

RSpec.describe SecureController, type: :controller do
  include_context "facebook authentication"
  it 'responds successfully' do
    post :test
    assert_response :success
  end
  it 'has a current user' do
    expect(:current_user).to_not be nil
  end
end
