class ApplicationController < ActionController::Base
  include Knock::Authenticable
  include ActionView::Layouts
end
