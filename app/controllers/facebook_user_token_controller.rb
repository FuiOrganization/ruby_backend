class FacebookUserTokenController < ActionController::API
  before_action :authenticate

  def create
    render json: auth_token, status: :created
  end

  private

  def authenticate
    raise Knock.not_found_exception_class unless entity.present?
  end

  def auth_token
    if entity.respond_to? :to_token_payload
      Knock::AuthToken.new payload: entity.to_token_payload
    else
      Knock::AuthToken.new payload: { sub: entity.id }
    end
  end

  def entity
    # return if facebook access token is not valid
    # obs: fetch_data method checks for token validity
    user_data = FacebookService.fetch_data(auth_params[:access_token])
    return if user_data.nil?
    # return if facebook access token is not current user's token
    return unless auth_params[:facebook_identifier] == user_data["id"]
    @entity ||= User.find_by facebook_identifier: auth_params[:facebook_identifier]
    # create user account if user doesn't exist
    @entity ||= User.create_facebook_user(auth_params[:facebook_identifier], user_data)
  end

  def auth_params
    params.require(:auth).permit :access_token, :facebook_identifier
  end
end
