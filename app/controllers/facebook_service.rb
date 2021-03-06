class FacebookService
  def self.valid_token?(access_token)
    status = false
    begin
      puts app_access_token_info
      debug_token = Koala::Facebook::API.new(app_access_token_info).debug_token(access_token)
      status = true if debug_token['data']['is_valid']
    end
    status
  end

  def self.fetch_data(access_token)
    Koala::Facebook::API.new(access_token).get_object('me', fields: 'id, first_name, email') if valid_token?(access_token)
  end

  def self.app_access_token_info
    @oauth ||= Koala::Facebook::OAuth.new("2052368771707314", "274692a041a4f21f79aa4130994ef366")
    @app_access_token ||= @oauth.get_app_access_token
  end
end
