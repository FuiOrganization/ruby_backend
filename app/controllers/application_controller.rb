class ApplicationController < ActionController::Base
  include Knock::Authenticable
  include ActionView::Layouts

  def test
    render :status => 201,
        :json => { :success => false,
        :data => {} }
  end
end
