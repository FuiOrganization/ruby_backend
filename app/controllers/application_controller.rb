class ApplicationController < ActionController::Base
  include ActionView::Layouts

  protect_from_forgery with: :exception

end
