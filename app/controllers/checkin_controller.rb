class CheckinController < SecureController
  def checkin
    @checkin = Checkin.new(user_id: current_user.id, experience_id: params['experience_id'])
    @checkin.save
  end
end
