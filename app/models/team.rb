class Team < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :participants, dependent: :destroy
  accepts_nested_attributes_for :participants
  VALID_NAME_REGEX = /\A[a-zA-Z0-9][a-zA-Z0-9\s]*[a-zA-Z0-9]\Z/
  validates :name,  presence: true,
                    length: { maximum: 30, minimum: 3 },
                    format: { with: VALID_NAME_REGEX },
                    uniqueness: true
end
