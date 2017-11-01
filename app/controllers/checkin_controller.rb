class CheckinController < SecureController
  def checkin
    @checkin = Checkin.new(user_id: current_user.id, experience_id: params['experience_id'])
    if @checkin.save
      render status: 200, :json => { success: true }
    else
      render status: 500, :json => { success: false }
    end
  end
end
