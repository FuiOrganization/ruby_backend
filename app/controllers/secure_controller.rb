class SecureController < ActionController::Base
  include Knock::Authenticable
  include ActionView::Layouts

  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def test; end

  def configure_permitted_parameters
    added_attrs = [:facebook_id, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
