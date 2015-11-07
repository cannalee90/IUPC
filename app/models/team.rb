class Team < ActiveRecord::Base
  has_many :participants
  accepts_nested_attributes_for :participants
  validates_associated :participants

end
