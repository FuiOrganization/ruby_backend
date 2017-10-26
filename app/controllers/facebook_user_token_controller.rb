class FacebookUserTokenController < ActionController::API
  before_action :authenticate

  def create
    render json: auth_token, status: :created
  end

  private

  def authenticate
    unless entity.present?
      raise Knock.not_found_exception_class
    end
  end

  def auth_token
    if entity.respond_to? :to_token_payload
      Knock::AuthToken.new payload: entity.to_token_payload
    else
      Knock::AuthToken.new payload: { sub: entity.id }
    end
  end

  def entity
    user = User.find_by facebook_identifier: auth_params[:facebook_identifier]
    if user.nil?
      if FacebookService.valid_token?(auth_params[:access_token])
        user_data = FacebookService.fetch_data(auth_params[:access_token])
        user = User::create_facebook_user(auth_params[:facebook_identifier], user_data)
        @entity ||= user if !user.nil?
      end
    else
      @entity ||= user if FacebookService.valid_token?(auth_params[:access_token])
    end
  end

  def auth_params
    params.require(:auth).permit :access_token, :facebook_identifier
  end
end
