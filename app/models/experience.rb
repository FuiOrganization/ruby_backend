class Experience < ApplicationRecord
  has_many :checkin
  attr_accessor :current_user
  # has user visited experience locale?
  def visited(user=nil)
    user ||= current_user
    return Checkin.where(user_id: current_user.id, experience_id: self.id).first.present?
  end
end
