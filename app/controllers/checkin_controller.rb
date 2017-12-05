class CheckinController < SecureController
  def history
    @history = Checkin.where(user_id: current_user).includes(:experience).order("created_at desc")
    render json: @history.to_json(methods: [:experience])
  end

  def checkin
    @checkin = Checkin.new(user_id: current_user.id, experience_id: params['experience_id'])
    if @checkin.save
      render status: 200, json: { success: true }
    else
      render status: 500, json: { success: false }
    end
  end
end
