class ApplicationController < ActionController::Base
  include Knock::Authenticable
  include ActionView::Layouts
  protect_from_forgery

  def test
    render :status => 201,
        :json => { :success => false,
        :data => {} }
  end
end
