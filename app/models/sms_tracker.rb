class SmsTracker < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  validates :group_id, uniqueness: true
end
