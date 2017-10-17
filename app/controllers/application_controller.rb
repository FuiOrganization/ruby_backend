class ApplicationController < ActionController::Base
  include Knock::Authenticable
  include ActionView::Layouts
  protect_from_forgery with: :exception
end
