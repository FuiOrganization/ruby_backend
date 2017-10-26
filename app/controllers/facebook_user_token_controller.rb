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

  def create_facebook_user(access_token, facebook_identifier)
    user_data = FacebookService.fetch_data(access_token)
    User.create_facebook_user(facebook_identifier, user_data)
  end

  def entity
    return unless FacebookService.valid_token?(auth_params[:access_token])
    user = User.find_by facebook_identifier: auth_params[:facebook_identifier]
    if user.nil?
      user = create_facebook_user(auth_params[:access_token], auth_params[:facebook_identifier])
    end
    @entity ||= user
  end

  def auth_params
    params.require(:auth).permit :access_token, :facebook_identifier
  end
end
