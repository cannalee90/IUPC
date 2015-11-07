class Team < ActiveRecord::Base
  has_many :participants
  accepts_nested_attributes_for :participants
  validates_associated :participants
  VALID_NAME_REGEX = /[\w\-_\s]+/
  validates :name, presence: true, length: { maximum: 30 },
                    format: { with: VALID_NAME_REGEX }
end
