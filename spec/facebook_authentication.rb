RSpec.shared_context "facebook authentication", :shared_context => :metadata do
  let(:user){
    user = User.new
    user.save
    user
  }

  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    {
      'Authorization': "Bearer #{token}"
    }
  end

  before(:each) do
    request.headers.merge!(authenticated_header)
  end
end
