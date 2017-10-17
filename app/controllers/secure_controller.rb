class SecureController < ApplicationController
  include Knock::Authenticable
  include ActionView::Layouts

  before_action :authenticate_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def test; end
end
