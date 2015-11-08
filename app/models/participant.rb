class Participant < ActiveRecord::Base
  belongs_to :team
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_SN_REGEX = /\d{8}/ 
  VALID_PHONE_REGEX = /\d{11}/ 
  validates :email, presence: true, uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  validates :sn, presence: true, uniqueness: true,
                    format: { with: VALID_SN_REGEX }
  validates :phone, presence: true, uniqueness: true,
                    format: { with: VALID_PHONE_REGEX }
  validates :role, presence: true

  
end