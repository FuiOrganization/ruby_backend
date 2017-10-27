require 'rails_helper'
require "facebook_authentication"

RSpec.describe SecureController, type: :controller do
  include_context "facebook authentication"
  it 'responds successfully' do
    post :test
    assert_response :success
  end
end
