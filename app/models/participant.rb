class Participant < ActiveRecord::Base
  belongs_to :team
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  validates :sn, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :role, presence: true
  
end