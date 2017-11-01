class Checkin < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  validates :user_id, presence: true
  validates :experience_id, presence: true
end
