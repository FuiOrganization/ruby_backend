class Experience < ApplicationRecord
  has_many :checkin
  attr_accessor :current_user
  # has user visited experience locale?
  def visited( user=nil )
    user ||= current_user
    Checkin.where(user_id: user.id, experience_id: id).first.present?
  end
end
